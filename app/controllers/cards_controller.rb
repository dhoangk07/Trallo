class CardsController < ApplicationController
  def index
      @cards = Card.all
  end

  # action
  def show
    @card = Card.find(params[:id])
   
  end
 
  # action
  def new
    @list = List.find(params[:list_id])
    @card = @list.cards.new
  end

  def create
    # params
    @card = Card.new(card_params)
    @list = @card.list
    @board = @list.board
    Activity.create(user_id: current_user.id, action: 'created ', objectable: @card)

    if @card.save
      respond_to do |format|
        format.html { redirect_to list_path(@card.list) }
        format.js
      end
      #redirect_to board_list_path(@list.board, @list)
    else
      render :new
    end

 
  end

  def edit
    @card = Card.find(params[:id])
    @list = @card.list
    Activity.create(user_id: current_user.id, action: 'edit', objectable: @card)
    respond_to do |format|
        format.html { redirect_to list_card_path(@card) }
        format.js
      end
  end

  def update
    @card = Card.find(params[:id])
    if @card.update_attributes(card_params)
      Activity.create(user_id: current_user.id, action: 'set due date', objectable: @card)
      
      respond_to do |format|
        format.html { redirect_to list_card_path(@card) }
        format.js

      end
    else
      render :edit
    end
  end

  def destroy
    @card = Card.find(params[:id])
    if @card.user.notification
      CardDestroyMailerJob.perform_later(@card.description, @card.user)
    end
    @card.destroy

    respond_to do |format|
      format.html { redirect_to list_path(@card.list_id) }
      format.js
    end
    #redirect_to list_cards_path
  end

  def invite_member

    @card = Card.find(params[:id])
    @user = User.find(params[:card][:new_member_id])
     InviteMemberMailerJob.perform_later(@card.user, @card)
    @card.users.append(@user)
    Activity.create(user_id: current_user.id, action: 'invited member for', objectable: @card)
    respond_to do |format|
      format.html { redirect_to list_path(@card.list_id) }
      format.js
    end
  end

  def remove_member
    @card = Card.find(params[:id])
    @user = User.find params[:user_id]
    @card.users.where(id: params[:user_id]).destroy_all
    Activity.create(user_id: current_user.id, action: 'removed member for', objectable: @card)
    respond_to do |format|
      format.html { redirect_to list_card_path(@card)}
      format.js
    end
  end

  def move_card
    @card = Card.find(params[:id])
    @list = List.find(params[:card][:list_member_id])
    @board = @list.board
    @card.list_id = @list.id
    @card.save
    Activity.create(user_id: current_user.id, action: 'moved', objectable: @card)
    
    respond_to do |format|
      format.html { redirect_to list_card_path(@card)}
      format.js
    end
  end

  def drop_card
    @card = Card.find(params[:id])
    old_list = @card.list
    @list = List.find(params[:card][:list_member_id])
    @board = @list.board
    @card.list_id = @list.id
    @card.save
    Activity.create(user_id: current_user.id, action: 'moved', objectable: @card, description: "from #{old_list.name} to #{@list.name}")
    
    respond_to do |format|
      format.js
    end
  end


  def edit_description
    @card = Card.find(params[:id])
    @list = @card.list
    Activity.create(user_id: current_user.id, action: 'edited description for', objectable: @card)

    respond_to do |format|
        format.html { redirect_to list_card_path(@card) }
        format.js
      end
  end

  def update_description
    @card = Card.find(params[:id])
    if @card.update_attributes(card_params)
      respond_to do |format|
        format.html { redirect_to list_card_path(@card) }
        format.js
      end
    end
  end

  def select_label
    @card = Card.find(params[:id])
    @label = Label.find(params[:card][:select_label_id])
    @card.labels.append(@label)
    respond_to do |format|
      format.html { redirect_to list_path(@card.list_id) }
      format.js
    end
  end

private

  def card_params
    params.require(:card).permit(:name, :list_id, :file , :description, :user_id, :due_date, :off_comment)
  end
end

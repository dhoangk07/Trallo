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

    respond_to do |format|
        format.html { redirect_to list_card_path(@card) }
        format.js
      end
  end

  def update
    @card = Card.find(params[:id])
    if @card.update_attributes(card_params)
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
    CardDestroyMailerJob.perform_later(@card.description, @card.user)
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
      UserMailer.notification_welcome_member_invited_card(@card.user, @card).deliver
    @card.users.append(@user)

    respond_to do |format|
      format.html { redirect_to list_path(@card.list_id) }
      format.js
    end
  end

  def remove_member
    @card = Card.find(params[:id])
    @user = User.find params[:user_id]
    @card.users.where(id: params[:user_id]).destroy_all
    
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
  
  respond_to do |format|
    format.html { redirect_to list_card_path(@card)}
    format.js
  end
end


  def edit_description
    @card = Card.find(params[:id])
    @list = @card.list

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
    params.require(:card).permit(:name, :list_id, :file , :description, :user_id, :due_date)
  end
end

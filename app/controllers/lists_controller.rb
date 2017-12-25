class ListsController < ApplicationController
  def index
      @lists = List.all
  end

  # action
  def show
    @list = List.find(params[:id])
    #@comment = @list.comments.new
  end
 
  # action
  def new
    @board = Board.find(params[:board_id])
    @list = @board.lists.new
    @card = @list.cards.new
  end

  def create
    # params
    @list = List.new(list_params)
    if @list.save
      respond_to do |format|
        format.html { redirect_to board_path(@list.board) }
        format.js
        Activity.create(user_id: current_user.id, action: 'added11111', objectable: @list)
      end
      
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
    @board = @list.board
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(list_params)
      redirect_to board_list_path(@list)
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    Activity.create(user_id: current_user.id, action: 'destroyed', objectable: @list.board, description: @list.name)
    respond_to do |format|
      format.html { redirect_to board_path(@list.board_id) }
      format.js
    end
    
  end

  def drop_card
    @card = Card.find(params[:id])
    @list = List.find(params[:id])
    @list = List.find(params[:card][:list_member_id])
    @board = @list.board
    @list.board_id = @board.id
    @list.save
    
    respond_to do |format|
      format.js
    end
   end

  def move_list
    @list = List.find(params[:id])
    @list.list_position = params[:list][:list_position]
    @list.save
    
    respond_to do |format|
      format.js
    end
   end


private

  def list_params
    params.require(:list).permit(:name, :board_id, :user_id, :list_position)
  end
end


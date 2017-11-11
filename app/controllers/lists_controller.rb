class ListsController < ApplicationController
  def index
      @lists = List.all
  end

  # action
  def show
    @list = List.find(params[:id])
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

    respond_to do |format|
      format.html { redirect_to board_path(@list.board_id) }
      format.js
    end
    
  end

private

  def list_params
    params.require(:list).permit(:name, :board_id)
  end
end


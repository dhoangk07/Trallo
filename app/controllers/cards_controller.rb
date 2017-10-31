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
    if @card.save
      redirect_to board_list_path(@list.board, @list)
    else
      render :new
    end
 
  end

  def edit
    @card = card.find(params[:id])
  end

  def update
    @card = card.find(params[:id])
    if @card.update_attributes(card_params)
      redirect_to card_path(@card)
    else
      render :edit
    end
  end

  def destroy
    @card = card.find(params[:id])
    @card.destroy
    redirect_to cards_path
  end

private

  def card_params
    params.require(:card).permit(:name, :list_id, :file )
  end
end

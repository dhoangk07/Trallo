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
  end

  def update
    @card = Card.find(params[:id])
    if @card.update_attributes(card_params)
      redirect_to list_card_path(@card)
    else
      render :edit
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    respond_to do |format|
      format.html { redirect_to list_path(@card.list_id) }
      format.js
    end
    #redirect_to list_cards_path
  end

private

  def card_params
    params.require(:card).permit(:name, :list_id, :file , :description,)
  end
end

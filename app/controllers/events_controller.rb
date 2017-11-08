class EventsController < ApplicationController
  def index
      @events = Event.all
  end

  # action
  #def show
  #  @event = Event.find(params[:id])
   
  #end
 
  # action
  def new
    @board = Board.find(params[:board_id])
    @event = @board.events.new
    @card = @event.cards.new
  end

  def create
    # params
    @event = Event.new(event_params)
    if @event.save
      respond_to do |format|
        format.html { redirect_to board_path(@event.board) }
        format.js
      end
      
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
    @board = @event.board
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to board_event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to board_path(@event.board_id) }
      format.js
    end
    
  end

private

  def event_params
    params.require(:event).permit(:title, :date, :reminder_date, :board_id)
  end
end


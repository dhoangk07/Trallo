class BoardsController < ApplicationController
  def index
      @boards = Board.where(user_id: current_user.id)
    
  end

  def search
    @board = Board.find params[:id]
    if (params[:search] && @board).present?
      @cards = @board.search(params[:search])
    end

    respond_to do |format|
      format.js
    end
  end

  # action
  def show
    @board = Board.find(params[:id])
    @boards = Board.where(user_id: current_user.id)
    unless current_user == @board.user
       flash[:notice] = 'You are not authorized'
       redirect_to root_path
    end

  end
 
  # action
  def new
    @board = Board.new
  end

  def create
    # params
    @board = Board.new(board_params)
    if @board.save
      redirect_to boards_path
    else
      render :new
    end
 
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    if @board.update_attributes(board_params)
      redirect_to board_path(@board)
    else
      render :edit
    end
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to boards_path
  end

  def invite_member

    @card = Card.find(params[:id])
    email = params[:board][:new_member_id] 
    if ValidatesEmailFormatOf::validate_email_format(email) == nil 
      UserMailer.welcome_email_to_join_board(email).deliver

      user = User.new(email: email)
      user.password = User.random_text
      user.password_confirmation = user.password
      user.without_name = true
      user.save

      
    else
      @invalid = true
    end
    
    respond_to do |format|
      format.js
      Activity.create(user_id: current_user.id, action: 'added22', objectable: @board)
    end
  end

private

  def board_params
    params.require(:board).permit(:name, :user_id, :photo, :search)
  end
end

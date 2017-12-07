class CommentsController < ApplicationController
  def create
  	# params
    @comment = Comment.new(comment_params)
    @card = Card.find(params[:card_id])
  	if @comment.save
       CommentCreatedMailerJob.perform_later(@comment)
      respond_to do |format|
        format.html { redirect_to board_list_path(@comment.list.board, @comment.list) }
        format.js
      end
  	end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to card_path(@comment.card_id) }
      format.js
    end
  end

  def edit
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html { redirect_to card_path(@comment.card_id) }
      format.js
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      respond_to do |format|
        format.html { redirect_to card_path(@comment.card_id) }
        format.js
      end
    else
      render :edit
    end
  end

  def show
    @comment = Comment.find(params[:id])
   
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :card_id)
  end
end

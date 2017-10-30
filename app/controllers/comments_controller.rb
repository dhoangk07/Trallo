class CommentsController < ApplicationController
  def create
  	# params
  	@comment = Comment.new(comment_params)
  	if @comment.save
  		redirect_to list_path(@comment.list)
  	end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to list_path(@list.book)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :list_id, )
  end
end

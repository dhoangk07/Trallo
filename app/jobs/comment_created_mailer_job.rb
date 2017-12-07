class CommentCreatedMailerJob < ApplicationJob
  queue_as :default

  def perform(comment)
  	comment.comment_created
  end
end

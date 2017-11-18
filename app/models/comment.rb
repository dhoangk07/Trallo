class Comment < ApplicationRecord
	belongs_to :card
	belongs_to :user


	after_create :comment_created

   	def comment_created
      
      #send card's owner
    	UserMailer.comment_created(card.user, self).deliver
      	
      	# send to card's member
      	card.users.each do |member|
      		UserMailer.comment_created(member, self).deliver
  		end
  	  	
  	  	 # send to who left comments on the card
  	  	new_users = []
  	  	card.comments.each do |comment|
  	  		new_users.append(comment.user, self)
  	  	end

  	  	new_users.each do |member|
    	 	UserMailer.comment_created(member).deliver
  		end

  		if
   end
end

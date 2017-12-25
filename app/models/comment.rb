class Comment < ApplicationRecord
	belongs_to :card
	belongs_to :user

    has_many :activities, as: :objectable

   	def comment_created
      
      #send card's owner
    	
      	a = [card.user]
      	# send to card's member
      	
        b = card.users
  	  	
  	  	 # send to who left comments on the card
  	  	new_users = []
  	  	card.comments.each do |comment|
  	  		new_users.append(comment.user)
  	  	end

        c = new_users

        #UserMailer.comment_created(card.user, self).deliver

        d = (a+b+c).uniq

        d.each do |user|
          UserMailer.comment_created(user, self).deliver
        end
   end
end

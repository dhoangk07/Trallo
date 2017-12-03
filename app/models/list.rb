class List < ApplicationRecord
	belongs_to :board
	has_many :cards

	belongs_to :user

	after_destroy :send_notification_email_destroy_list
  
	def send_notification_email_destroy_list
    	UserMailer.notification_email_destroy_list(user, self).deliver
    end

end

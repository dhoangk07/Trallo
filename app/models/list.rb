class List < ApplicationRecord
	belongs_to :board
	has_many :cards, dependent: :destroy

	belongs_to :user

	after_destroy :send_notification_email_destroy_list
  
	def send_notification_email_destroy_list
    	UserMailer.notification_email_destroy_list(user, self).deliver
    end

    attr_accessor :list_member_id
end

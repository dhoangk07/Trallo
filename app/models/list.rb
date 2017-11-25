class List < ApplicationRecord
	belongs_to :board
	has_many :cards, dependent: :destroy

	has_many :lists_users
	has_many :users, through: :lists_users, dependent: :destroy

	belongs_to :user #owner

	after_destroy :send_notification_email_destroy_list

    def send_notification_email_destroy_list
       UserMailer.notification_email_destroy_list(user).deliver
    end
end


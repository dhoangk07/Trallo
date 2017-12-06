class Card < ApplicationRecord
	belongs_to :list
	has_attached_file :file
	validates_attachment_content_type :file, content_type: ["application/pdf","application/vnd.ms-excel",     
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/msword", 
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
             "text/plain"]

    has_many(:cards_labels)
	has_many :labels, through: :cards_labels
	has_many :comments, dependent: :destroy
	has_many :cards_users
	has_many(:users, {through: :cards_users, dependent: :destroy})
	belongs_to :user # owner

	attr_accessor :new_member_id

	attr_accessor :remove_member_id

	def self.notify_due_date
		where(due_date: Time.current.to_date).find_each do |card|
			card.notify_owner_due_date
		end
	end

	def notify_owner_due_date
		CardMailer.notify_due_date(self).deliver
	end


end


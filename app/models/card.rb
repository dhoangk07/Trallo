class Card < ApplicationRecord
	belongs_to :list
	has_attached_file :file
	validates_attachment_content_type :file, content_type: ["application/pdf","application/vnd.ms-excel",     
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/msword", 
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
             "text/plain"]

    has_many :cards_labels
	has_many :labels, through: :cards_labels
	has_many :comments, dependent: :destroy
	has_many :cards_users
	has_many :users, through: :cards_users, dependent: :destroy
	belongs_to :user # owner

	attr_accessor :new_member_id

end


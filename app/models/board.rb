class Board < ApplicationRecord
	belongs_to :user
	has_many :lists, dependent: :destroy
	has_many :events, dependent: :destroy

	has_many :activities, as: :objectable

	has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

    attr_accessor :new_member_id

    def send_welcome_email_to_join_board
   	UserMailer.welcome_email_to_join_board(self).deliver
   	end

   	def cards
   		Card.where(list_id: lists.select(:id))
   	end

   	def activities
   		Activity.where(objectable_id: lists.select(:id), objectable_type: 'List')
   		        .or(Activity.where(objectable_id: cards.select(:id), objectable_type: 'Card'))
   		        .or(Activity.where(objectable_id: self.id, objectable_type: 'Board'))
	end

   	def search(search_query)
	  if search_query
    	cards.where('name LIKE ?', "%#{search_query}%")
 	  end
 	end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :boards
  has_many :comments

  has_many :cards_users
  has_many :cards, through: :cards_users, dependent: :destroy

  has_many :lists_users
  has_many :lists, through: :lists_users, dependent: :destroy

  def name 
  		result = ""
  	if last_name.present?
  		result = result + last_name
  	end

  	if first_name.present?
  		result = result + first_name
  	end
  	result
  end
  
   validates_presence_of :first_name, unless: :without_name
   validates_presence_of :last_name, unless: :without_name

   attr_accessor :without_name





   after_create :send_welcome_email

   def send_welcome_email
   	UserMailer.welcome_email(self).deliver
   end

    has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/


    def self.random_text
      (0...8).map { (65 + rand(26)).chr }.join
    end

end

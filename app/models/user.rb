class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :boards
  has_many :comments
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
end

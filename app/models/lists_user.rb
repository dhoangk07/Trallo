class ListsUser < ApplicationRecord
	belongs_to :list
	belongs_to :user
end

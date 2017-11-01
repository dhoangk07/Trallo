class Label < ApplicationRecord
	has_many :cards_labels
	has_many :cards, through: :cards_labels
end

class AddColumnForCardsLables < ActiveRecord::Migration[5.1]
  def change
  	add_column :cards_lables, :card_id, :integer
    add_column :cards_lables, :lable_id, :integer
  end
end

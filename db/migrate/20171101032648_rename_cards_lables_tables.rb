class RenameCardsLablesTables < ActiveRecord::Migration[5.1]
  def change
  	rename_table :cards_lables, :cards_labels
  end
end

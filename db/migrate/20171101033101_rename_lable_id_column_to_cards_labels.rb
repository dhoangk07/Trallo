class RenameLableIdColumnToCardsLabels < ActiveRecord::Migration[5.1]
  def change
  	rename_column :cards_labels, :lable_id, :label_id
  end
end

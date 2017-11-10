class RenameListIdToComments < ActiveRecord::Migration[5.1]
  def change
  	rename_column :comments, :list_id, :card_id
  end
end

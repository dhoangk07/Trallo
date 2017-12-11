class AddListPositionToLists < ActiveRecord::Migration[5.1]
  def change
  	add_column :lists, :list_position, :integer
  end
end

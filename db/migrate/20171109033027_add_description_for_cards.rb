class AddDescriptionForCards < ActiveRecord::Migration[5.1]
  def change
  	add_column :cards, :description, :string
  end
end

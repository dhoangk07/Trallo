class AddColorToLabels < ActiveRecord::Migration[5.1]
  def change
  	add_column(:labels, :color, :string)
  end
end

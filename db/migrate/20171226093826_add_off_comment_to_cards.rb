class AddOffCommentToCards < ActiveRecord::Migration[5.1]
  def change
  	add_column :cards, :off_comment, :boolean
  end
end

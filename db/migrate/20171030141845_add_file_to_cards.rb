class AddFileToCards < ActiveRecord::Migration[5.1]
  def up
    add_attachment :cards, :file
  end

  def down
    remove_attachment :cards, :file
  end
end

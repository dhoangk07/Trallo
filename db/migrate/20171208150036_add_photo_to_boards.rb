class AddPhotoToBoards < ActiveRecord::Migration[5.1]
  def up
    add_attachment :boards, :photo
  end

  def down
    remove_attachment :boards, :photo
  end
end

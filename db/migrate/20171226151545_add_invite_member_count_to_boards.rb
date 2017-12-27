class AddInviteMemberCountToBoards < ActiveRecord::Migration[5.1]
  def change
  	add_column :boards, :invite_member_count, :integer, default: 0
  end
end

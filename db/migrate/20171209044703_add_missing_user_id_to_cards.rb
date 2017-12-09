class AddMissingUserIdToCards < ActiveRecord::Migration[5.1]
  def change
  	unless ActiveRecord::Base.connection.column_exists?('cards', 'user_id')
  		add_column :cards, :user_id, :integer
  	end
  end
end

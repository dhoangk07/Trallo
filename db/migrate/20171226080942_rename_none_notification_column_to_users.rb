class RenameNoneNotificationColumnToUsers < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :none_notification, :notification
  end
end

class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.string :action
      t.integer :objectable_id
      t.string :objectable_type

      t.timestamps
    end
  end
end

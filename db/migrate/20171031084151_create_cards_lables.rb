class CreateCardsLables < ActiveRecord::Migration[5.1]
  def change
    create_table :cards_lables do |t|

      t.timestamps
    end
  end
end

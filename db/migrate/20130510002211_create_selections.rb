class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.integer :restaurant_id
      t.integer :bottle_id

      t.timestamps
    end
  end
end

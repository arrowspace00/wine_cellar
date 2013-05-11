class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.integer :restaurant_id
      t.integer :bottle_id
      t.integer :priority, :default => 9999

      t.timestamps
    end
  end
end

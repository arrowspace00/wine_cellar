class CreateStickers < ActiveRecord::Migration
  def change
    create_table :stickers do |t|
      t.string :name
      t.integer :selection_id
      t.text :description
      t.string :info
      t.integer :priority

      t.timestamps
    end
  end
end

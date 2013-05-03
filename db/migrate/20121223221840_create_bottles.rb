class CreateBottles < ActiveRecord::Migration
  def change
    create_table :bottles do |t|
      t.integer :bin
      t.string :name
      t.string :winery
      t.string :style_type
      t.string :main_varietal
      t.string :appellation
      t.string :sub_region
      t.string :main_region
      t.string :country
      t.string :vintage
      t.integer :price
      t.string :second_varietal
      t.string :third_varietal
      t.string :rp
      t.string :ws
      t.integer :cases
      t.integer :alcohol
      t.text :profile

      t.timestamps
    end
  end
end

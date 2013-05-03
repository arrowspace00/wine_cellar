class Loc < ActiveRecord::Migration
  def change
	add_column :bottles, :loc, :string
  end
end

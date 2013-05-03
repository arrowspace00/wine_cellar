class AddPhotoExtensionToBottle < ActiveRecord::Migration
  def change
	add_column :bottles, :extension, :string
  end
end

class Selection < ActiveRecord::Base

  attr_accessible :bottle_id, :restaurant_id, :priority

  belongs_to :restaurant

  belongs_to :bottle

  # accepts_nested_attributes_for :bottle

end

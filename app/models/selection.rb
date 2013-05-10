class Selection < ActiveRecord::Base

  attr_accessible :bottle_id, :restaurant_id

  belongs_to :restaurant

  belongs_to :bottle

end

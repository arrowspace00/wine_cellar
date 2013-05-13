class Selection < ActiveRecord::Base

  attr_accessible :bottle_id, :restaurant_id, :priority, :stickers, :stickers_attributes

  belongs_to :restaurant

  belongs_to :bottle

  has_many :stickers, :order => "priority ASC"

  accepts_nested_attributes_for :stickers, :allow_destroy => true

end

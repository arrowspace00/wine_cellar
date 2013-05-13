class Restaurant < ActiveRecord::Base
  
  attr_accessible :franchise_id, :name, :selections, :selections_attributes, :bottles, :bottles_attributes, :stickers, :stickers_attributes

  has_many :selections, :order => 'priority ASC'

  has_many :bottles, :through => :selections, :order => 'priority ASC'

  accepts_nested_attributes_for :selections, :allow_destroy => true

end

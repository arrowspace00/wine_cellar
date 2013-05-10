class Restaurant < ActiveRecord::Base
  
  attr_accessible :franchise_id, :name, :selections, :selections_attributes

  has_many :selections

  has_many :bottles, :through => :selections


end

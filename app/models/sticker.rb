class Sticker < ActiveRecord::Base
  attr_accessible :description, :info, :name, :priority, :selection_id
end

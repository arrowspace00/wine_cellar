class Bottle < ActiveRecord::Base

# Mass Assignment 
  attr_accessible :alcohol, :appellation, :bin, :loc, :cases, :country, :main_region, :main_varietal, :name, :photo, :price, 
							:profile, :rp, :second_varietal, :style_type, :sub_region, :third_varietal, :vintage, :winery, :ws

							
# Model Strengthened by Validation
	validates :name, :presence => true, 
								:length => { :minimum => 1 }
								
	validates :bin, :presence => true, 
								:length => { :minimum => 4, :maximum => 4 }
								
	validates_uniqueness_of :bin, 
								:message => "- - This bin# is already in use. Please choose a bin# that is not being used."
																		  
	validates_numericality_of :bin,
								:allow_nil => false,
								:greater_than => 999,
								:less_than => 10000,
								:message => "- Please enter a four-digit value between 1000-9999"
	
def previous
	Bottle.limit(1).order("id DESC").where("id < ?", id).first
end

def next
	Bottle.limit(1).order("id DESC").where("id > ?", id).first
end


def self.import(file)
	CSV.foreach(file.path, headers: true) do |row|
		Bottle.create! row.to_hash
	end
end

	
	# after the bottle has been written to the database, 
	# deal with writing any image data to the filesystem
	
	after_save :store_photo
	
	def photo=(file_data)
		unless file_data.blank?
			@file_data = file_data
			self.extension = file_data.original_filename.split('.').last.downcase
		end
	end
	
	PHOTO_STORE = File.join Rails.root, 'public', 'photo_store'
	
	def photo_filename
		File.join PHOTO_STORE, "#{id}.#{extension}"
	end
	
	def photo_path
		"/photo_store/#{id}.#{extension}"
	end
		
	def has_photo?
		File.exists? photo_filename
	end

	
private
	
	def store_photo
		if @file_data
			FileUtils.mkdir_p PHOTO_STORE
			File.open(photo_filename, 'wb') do |f|
				f.write(@file_data.read)
				end
			@file_data = nil
		end
	end
	
	
	
end

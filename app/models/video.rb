class Video < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :comments
	has_many :thumbnails
	mount_uploader :media, MediaUploader
	attr_accessible :media

	validates_presence_of :category
	validates_presence_of :user
	validates_presence_of :media

	def processed!
		update_attribute(:processed, true)
	end
end

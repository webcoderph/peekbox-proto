class Album < ActiveRecord::Base
	attr_accessible :album_id, :user_id, :image
	belongs_to :user
	has_many :pictures
	mount_uploader :image, ImageUploader
end

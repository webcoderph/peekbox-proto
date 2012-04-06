class Album < ActiveRecord::Base
	attr_accessible :album_id, :user_id, :image, :pictures
  belongs_to :user
	mount_uploader :image, ImageUploader
	has_many :pictures
end

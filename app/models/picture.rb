class Picture < ActiveRecord::Base
  belongs_to :album
  belongs_to :user
	mount_uploader :file, PictureUploader
	validates_presence_of :file
end

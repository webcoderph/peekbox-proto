class Video < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :comments
	mount_uploader :media, MediaUploader

	validates_presence_of :category
	validates_presence_of :user
end

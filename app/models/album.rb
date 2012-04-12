class Album < ActiveRecord::Base
	attr_accessible :album_id, :user_id, :image
	belongs_to :user
	has_many :pictures
	mount_uploader :image, ImageUploader
	scope :for_page, order(:created_at).limit(3).reverse_order
	scope :featured, where(:featured => true)
	scope :non_featured, where(:featured => false)
end

class Video < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :comments

	validates_presence_of :category
end

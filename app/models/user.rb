class User < ActiveRecord::Base
	has_many :events
	has_many :videos
	has_many :albums
	has_many :pictures, :through => :album
end

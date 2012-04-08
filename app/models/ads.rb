class Ads < ActiveRecord::Base
	has_many :ads_state

	mount_uploader :adsBannerImage, AdsUploader
	
end

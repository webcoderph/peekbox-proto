class HomeController < ApplicationController
  def index
		@banners = Banner.all
		@featured_videos = Video.featured.limit(3)
		@latest_videos = Video.for_page
		@events = Event.featured.limit(3)
		@ad ||= Ads.find_by_location("home")
  end

end

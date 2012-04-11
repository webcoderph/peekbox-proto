class HomeController < ApplicationController
  def index
		@banners = Banner.all
		@videos = Video.featured
		@events = Event.limit(3)
		@ad ||= Ads.find_by_location("home")
  end

end

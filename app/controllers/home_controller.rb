class HomeController < ApplicationController
  def index
		@videos = Video.processed.limit(3)
		@events = Event.limit(3)
		@ad ||= Ads.find_by_location("home")
  end

end

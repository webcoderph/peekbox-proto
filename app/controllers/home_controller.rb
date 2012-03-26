class HomeController < ApplicationController
  def index
		@videos = Video.processed.limit(3)
		@events = Event.limit(3)
  end

end

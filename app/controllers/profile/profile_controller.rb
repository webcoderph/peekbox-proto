class Profile::ProfileController < ApplicationController
	before_filter :authenticate_user!

	def index
		#show all information of user
		@user = current_user
		@recent_videos = Dashboard.recent_videos(current_user)
		@recent_albums = Dashboard.recent_albums(current_user)
		@recent_events = Dashboard.recent_events(current_user)
	end

end

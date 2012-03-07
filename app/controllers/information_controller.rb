class InformationController < ApplicationController

	def index
	end	

  def search
  end

  def show
		@user = User.find_by_username(params[:username])
		@videos = @user.videos
		@albums = @user.albums
		@events = @user.events
  end

end

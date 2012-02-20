class Profile::VideosController < Profile::ProfileController

	def index
		@recent_videos = Dashboard.recent_videos(current_user)
	end

	def new
		@all_category = Category.all
		@video = Video.new
	end

	def show
	end

	def create
		@video = Video.new(params[:video])
		@video.user = current_user
		if @video.save!
			redirect_to @video, :notice => "Successfully uploaded a video!"
		else
			render :action => 'new'
		end
	end
end

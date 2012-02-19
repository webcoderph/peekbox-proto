class Profile::VideosController < Profile::ProfileController

	def index
		@recent_videos = Dashboard.recent_videos(current_user)
	end

	def new
		@category = Category.all
	end

	def show
	end

	def create
		@video = Video.new
		@video.title = params[:title]
		@video.description = params[:description]
		@video.user = current_user
		@video.category = params[:category_id]
		@video.inspect
		if @video.save!
			redirect_to @video, :notice => "Successfully uploaded a video!"
		else
			render :action => 'new'
		end
	end
end

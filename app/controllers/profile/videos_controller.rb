class Profile::VideosController < Profile::ProfileController

	def index
		@recent_videos = Dashboard.recent_videos(current_user)
	end

	def new
		@all_category = Category.all
		@video = Video.new
	end

	def create
		@video = Video.new
		@video.title = params[:video][:title]
		@video.description = params[:video][:description]
		@video.category = Category.find_by_id(params[:video][:category_id])
		@video.media = params[:video][:media]
		@video.user = current_user
		if @video.save! 
			redirect_to @video, :notice => "Successfully uploaded a video!"
		else
			render :controller => "videos", :action => "index"
		end
	end
end

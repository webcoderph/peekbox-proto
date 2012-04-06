class Profile::VideosController < Profile::ProfileController

	def index
		@videos = current_user.videos.processed.order("id").page(params[:page])
		@all_categories = Category.all
	end

	def new
		@all_category = Category.all
		@video = Video.new
	end

	def edit
		@all_category = Category.all
		@video = Video.find_by_id(params[:id])
	end

	def update 
		@video = Video.find_by_id(params[:video][:id])
		@video.title = params[:video][:title]
		@video.description = params[:video][:description]
		@video.category = Category.find_by_id(params[:video][:category_id])
		if @video.save! 
			redirect_to profile_videos_path, :notice => "Successfully updated a video!"
		else
			render :action => "edit"
		end
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
			render :action => "new"
		end
	end
end

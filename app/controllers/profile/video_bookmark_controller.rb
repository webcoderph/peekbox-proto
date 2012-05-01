class Profile::VideoBookmarkController < Profile::ProfileController
  def index
		@marked= current_user.video_marked
  end

  def new
  end

  def create
		@bookmark = VideoBookmark.new
		@bookmark.user = current_user
		@bookmark.video_marked = Video.find(params[:video])
		if @bookmark.save!
			redirect_to profile_video_bookmark_index_path, :notice => "Successfully added a bookmark"
		else
			redirect_to videos_path, :notice => "Error adding bookmark"
		end
  end

	def destroy
		@bookmarked = VideoBookmark.where(:user_id => current_user.id, :video_id => params[:id]).first
		if @bookmarked.destroy
			redirect_to profile_video_bookmark_index_path, :notice => "Successfully removed a bookmark"
		else
			redirect_to videos_path, :alert => "Error removing a bookmark"
		end
	end

  def update
  end

  def edit
  end

  def unbookmark
		@bookmarked = VideoBookmark.where(:user_id => current_user.id, :video_id => params[:id]).first
		if @bookmarked.destroy
			redirect_to profile_video_bookmark_index_path, :notice => "Successfully removed a bookmark"
		else
			redirect_to videos_path, :alert => "Error removing a bookmark"
		end

  end

end

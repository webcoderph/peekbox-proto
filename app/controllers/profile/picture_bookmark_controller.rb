class Profile::PictureBookmarkController < Profile::ProfileController
  def index
		@marked= current_user.picture_marked
  end

  def new
  end

	def unbookmark
		@bookmarked = PictureBookmark.where(:user_id => current_user.id, :picture_id => params[:id]).first
		if @bookmarked.destroy
			redirect_to profile_picture_bookmark_index_path, :notice => "Successfully removed a bookmark"
		else
			redirect_to pictures_path, :alert => "Error removing a bookmark"
		end

	end

  def create
		@bookmark = PictureBookmark.new
		@bookmark.user = current_user
		@bookmark.picture_marked = Picture.find(params[:picture])
		if @bookmark.save!
			redirect_to profile_picture_bookmark_index_path, :notice => "Successfully added a bookmark"
		else
			redirect_to pictures_path, :notice => "Error adding a picture bookmark"
		end
  end

  def destroy
		@bookmarked = PictureBookmark.where(:user_id => current_user.id, :picture_id => params[:id]).first
		if @bookmarked.destroy
			redirect_to profile_picture_bookmark_index_path, :notice => "Successfully removed a bookmark"
		else
			redirect_to pictures_path, :alert => "Error removing a bookmark"
		end
  end

  def update
  end

  def edit
  end

end

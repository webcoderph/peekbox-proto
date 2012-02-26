	class Profile::PicturesController < Profile::ProfileController
  def index
		@album = current_user.albums.find_by_id(params[:album_id])
		@pictures = @album.pictures
  end

  def show
  end

  def update
  end

  def destroy
  end

end

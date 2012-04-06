class Profile::PicturesController < Profile::ProfileController
  def index
		@album = Album.find_by_id(params[:album_id])
		if @album.user == current_user
			@pictures = @album.pictures
		else
			@pictures = nil
		end
  end

  def show
  end

  def create
		@album = Album.find_by_id(params[:album_id])
		if !@album.nil?
			@picture = Picture.new(params[:picture])
			@picture.user = current_user
			@picture.album = @album
			if @picture.save!
				redirect_to profile_album_pictures_path(@album), :notice => "Successfully added a Photo!"
			else
				render :action => "index"
			end
		else
			render :action => "index"
		end
  end

  def update
  end

  def destroy
  end

end

class Profile::PicturesController < Profile::ProfileController
  def index
		@album = current_user.albums.find_by_id(params[:album_id])
		@pictures = @album.pictures
  end

  def show
  end

  def create
		@album = current_user.albums.find_by_id(params[:album_id])
		if !@album.nil?
			@picture = Picture.new(params[:picture])
			@picture.user = current_user
			@picture.album = @album
			if @picture.save!
				redirect_to album_path(@album), :notice => "Successfully added a Photo!"
			else
				render :action => "new"
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

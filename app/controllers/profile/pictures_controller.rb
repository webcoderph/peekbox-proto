class Profile::PicturesController < Profile::ProfileController

  def index
		@album = current_user.albums.find(params[:album_id])
		@pictures = @album.pictures
  end

  def edit
		@album = current_user.albums.find(params[:album_id])
		@picture = Picture.find(params[:id])
  end

	def multiupload
		@album = Album.find_by_id(params[:album_id])
		if !@album.nil?
			@picture = Picture.new(params[:picture])
			@picture.user = current_user
			@picture.album = @album
			if @picture.save!
				render :nothing => true
			else
				render :nothing => true
			end
		else
			render :action => "index"
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

class Profile::AlbumsController < Profile::ProfileController 

  def index
		@albums = Album.all
  end

	def create
		@album = Album.new(params[:album])
		@album.user = current_user
		if @album.save! 
			redirect_to @album, :notice => "Successfully added an Album!"
		else
			render :action => "new"
		end
	end

  def new
		@album = Album.new
  end

end

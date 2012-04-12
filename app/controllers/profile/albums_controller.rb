class Profile::AlbumsController < Profile::ProfileController 

  def index
		@albums = current_user.albums.page(params[:page])
  end

	def create
		@album = Album.new
		@album.title = params[:album][:title]
		@album.location = params[:album][:location]
		@album.image = params[:album][:image]
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

	def update
		@album = Album.find_by_id(params[:id])
		@album.title = params[:album][:title]
		@album.location = params[:album][:location]
		@album.image = params[:album][:image]
		@album.featured = params[:album][:featured]
		if @album.save!
			redirect_to @album, :notice => "Successfully updated an Album!"	
		else
			render :action => "new"
		end
	end

	def edit
		unless current_user.admin
			@album = current_user.albums.find_by_id(params[:id])
		else
			@album = Album.find_by_id(params[:id])
		end
	end
end

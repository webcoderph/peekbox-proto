class PicturesController < ApplicationController
  def index
		@album = Album.find_by_id(params[:album_id])
		@pictures = @album.pictures.page(params[:page])
  end

  def show
		@picture = Picture.find_by_id(params[:id])
  end
end

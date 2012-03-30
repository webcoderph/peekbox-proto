class AlbumsController < ApplicationController
  def index
		@albums = Album.order("created_at").page(params[:page])
  end

  def show
		@album = Album.find_by_id(params[:id])
  end

end

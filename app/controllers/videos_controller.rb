class VideosController < ApplicationController
  def index
		@videos = Video.all
		@all_categories = Category.all
  end

  def show
		@video = Video.find_by_id(params[:id])
		@all_categories = Category.all
  end

end

class VideosController < ApplicationController
  def index
		@videos = Video.processed.page(params[:page])
		@all_categories = Category.all
		@ad ||= Ads.find_by_location("videos")
  end

  def show
		@video = Video.find_by_id(params[:id])
		@all_categories = Category.all
		if !@video.processed?
			flash[:notice] = "Video is still Processing. Please Wait"
		end
		
  end

end

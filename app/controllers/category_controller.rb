class CategoryController < ApplicationController
  def show
		@all_categories = Category.all
		@videos = Category.find_by_id(params[:id]).videos
		@title = Category.find_by_id(params[:id])
  end

end

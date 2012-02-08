class Profile::AlbumsController < ApplicationController
	before_filter :authorized?

	def authorized?
    #check if authorized here.
	end

  def index
  end

end

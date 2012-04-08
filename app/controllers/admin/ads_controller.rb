class Admin::AdsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :check_admin!

	def check_admin!
		unless current_user.admin
			redirect_to destroy_user_session_url, :method => :delete
		end
	end

  def index
  end

  def new
		@ads = Ads.new
  end

  def create
  end

  def update
  end

  def destroy
  end

  def show
  end

end

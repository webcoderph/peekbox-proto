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
		@ads = Ads.create
		@ads.name = params[:ads][:name]
		@ads.url = params[:ads][:url]
		@ads.location = params[:ads][:location]
		@ads.banner = params[:ads][:banner]
		if @ads.save!
			redirect_to admin_ads_path, :notice => "Successfully added an Ad"
		else
			redirect_to new_admin_ad_path, :alert => "Failed to Add an Ad"
		end
  end

  def update
  end

  def destroy
  end

  def show
  end

end

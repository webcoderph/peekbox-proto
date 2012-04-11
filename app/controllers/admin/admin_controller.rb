class Admin::AdminController < ApplicationController
	before_filter :authenticate_user!
	before_filter :check_admin!

	def check_admin!
		unless current_user.admin
			redirect_to destroy_user_session_url, :method => :delete
		end
	end
end

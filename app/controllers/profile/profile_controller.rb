class Profile::ProfileController < ApplicationController
	before_filter :authenticate_user!

	def index
	#show all information of user

		@user = current_user
	end

end

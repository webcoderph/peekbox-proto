class Profile::UserController < Profile::ProfileController

	def index
		@user = current_user
	end


	def edit
		
	end

end

class Profile::UserController < Profile::ProfileController

	def index
		@user = current_user
	end
	def result
	end

	def search
	end

	def edit
	end

end

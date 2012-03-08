class Profile::UsersController < Profile::ProfileController
  def index
  end

  def search
		@users = User.find_by_first_name(params[:search])	
  end

end

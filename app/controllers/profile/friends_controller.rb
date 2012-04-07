class Profile::FriendsController < Profile::ProfileController
  def index
		@friends = current_user.friends.order("id").page(params[:page])
  end

	def all
		@friends = User.order("id").where("id != ?", "#{current_user.id}")
		@friends = @friends.page(params[:page])
	end

	def search
		@friends = Friends.search_username(params[:friend][:username])
	end

  def show
  end

  def new
  end

  def edit
  end

  def destroy
  end

  def update
  end

  def create
  end

end

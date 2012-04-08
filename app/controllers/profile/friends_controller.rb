class Profile::FriendsController < Profile::ProfileController
  def index
		@friends = current_user.friends.order("id").page(params[:page])
  end

	def all
		@friends = User.order("id").where("id != ?", "#{current_user.id}")
		@friends = @friends.page(params[:page])
	end

	def add
		@user = current_user
		@friend = User.find(params[:id])
		if @user.is_stranger(@friend)
			@friend.friends << @user
			@user.friends << @friend
			redirect_to profile_friends_path, :notice => "Successfully added #{@friend.username} as a friend!"
		else
			redirect_to profile_friends_path, :error => "unable to add this friend"
		end
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

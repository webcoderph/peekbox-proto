class Admin::UserController < Admin::AdminController
  def index
		@users = User.not_admin.page(params[:page])
  end

  def ban
		@user = User.find(params[:format])
		@user.banned = true
		if @user.save!
			redirect_to admin_user_index_path, :notice => "Successfully Banned a User" 		
		else
			redirect_to admin_user_index_path, :alert => "Error Banning a User" 		
		end
  end

	def unban
		@user = User.find(params[:format])
		@user.banned = false
		if @user.save!
			redirect_to admin_user_index_path, :notice => "Successfully Un-Banned a User" 		
		else
			redirect_to admin_user_index_path, :alert => "Error UnBanning a User" 		
		end

	end
	
	def ban_list
		@users = User.ban_list.page(params[:page])
	end

end

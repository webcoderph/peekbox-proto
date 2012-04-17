class Admin::UserController < Admin::AdminController
  def index
		@users = User.not_admin.page(params[:page])
  end

  def ban
  end

end

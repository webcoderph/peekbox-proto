class Profile::ProfilesController < ApplicationController
  before_filter :authenticate_user!
end

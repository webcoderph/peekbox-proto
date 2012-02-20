class Profile::EventsController < Profile::ProfileController

	def index
		@user_events = current_user.events
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(params[:event])
	end

end

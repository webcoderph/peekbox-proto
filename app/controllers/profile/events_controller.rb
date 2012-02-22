class Profile::EventsController < Profile::ProfileController

	def index
		@user_events = current_user.events
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(params[:event])
		@event.user = current_user
		if @event.save
			redirect_to @event, :notice => "Successfully added an Event!"	
		else
			render :action => "new"
		end
	end

	def edit
		@user_event = current_user.events.find_by_id(params[:id])
	end

end

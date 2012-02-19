class EventsController < ApplicationController
  def index
		@events = Event.all
  end

  def show
		@events = Event.find_by_id(params[:id])
  end

end

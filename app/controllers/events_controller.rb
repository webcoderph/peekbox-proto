class EventsController < ApplicationController
  def index
		@events = Event.order("created_at").page(params[:page])
  end

  def show
		@event = Event.find_by_id(params[:id])
  end

end

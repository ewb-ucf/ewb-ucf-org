class EventsController < ApplicationController

  include EventsHelper
 
  def index
  	@events = Event.all
 	end

 	def show
 		@event = Event.friendly.find(params[:id])
  end

  def new 
  	@event = Event.new
  end

 	def create
  	@event = Event.new(event_params)
  	@event.save

  	redirect_to event_path(@event)
  end  	

  def edit
  	@event = Event.friendly.find(params[:id])
  end

  def destroy
  	@event = Event.friendly.find(params[:id])
   	@event.destroy

   	redirect_to events_path
  end

  def update
  	@event = Event.friendly.find(params[:id])
   	@event.update(event_params)

   	flash.notice = "Event '#{@event.title}' updated!"
   	redirect_to event_path(@event)
 	end
  
end

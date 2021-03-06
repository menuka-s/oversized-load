class EventsController < ApplicationController

  def index
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
    if @event.creator_id == session[:user_id] && @event.pub_date > Date.today
      render "events/edit"
    else
      redirect_to @event
    end
  end

  def create
    @event = Event.new(event_params)
    @event.creator = current_user
    if @event.save
      redirect_to @event
    else
      render "events/new"
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to @event
    else
      render 'events/edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to '/'
  end

  private
    def event_params
      params.require(:event).permit(:pub_date, :name, :movie_id)
    end

end

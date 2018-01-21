class EventsController < ApplicationController

  layout 'application'

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Successfully made new event"
      redirect_to(admin_path)
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:notice] = "Successfully updated event"
      redirect_to(admin_path)
    end
  end

  def delete
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Successfully deleted future event"
    redirect_to(admin_path)
  end

  private

  def event_params
    params.require(:event).permit(:title, :date, :description)
  end

end

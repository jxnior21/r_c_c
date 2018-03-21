class FutureEventsController < ApplicationController

  layout 'application'

  def create
    @fevent = FutureEvent.new(event_params)
    if @fevent.save
      flash[:notice] = "Successfully made new future event"
      redirect_to(admin_path)
    end
  end

  def update
    @fevent = FutureEvent.find(params[:id])
    if @fevent.update_attributes(event_params)
      flash[:notice] = "Successfully updated future event"
      redirect_to(admin_path)
    end
  end

  def destroy
    @fevent = FutureEvent.find(params[:id])
    @fevent.destroy
    flash[:notice] = "Successfully deleted future event"
    redirect_to(admin_path)
  end

  private

  def event_params
    params.require(:future_event).permit(:title, :date, :kind)
  end

end

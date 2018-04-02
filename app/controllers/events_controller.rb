class EventsController < ApplicationController

  before_action :confirm_logged_in, :except => [:create, :update, :destroy]

  def show
    @event = Event.find_by(title: params[:title])
    respond_to do |format|
      format.pdf do
          pdf = RegisteredPdf.new(@event)
          send_data pdf.render, filename: "Registered: #{@event.title}",
                                type: "application/pdf",
                                disposition: "inline"
      end
    end
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Successfully made new event: #{@event.title}"
      redirect_to(admin_path)
    end
  end

  def update
    @event = Event.find_by(title: params[:title])
    if @event.update_attributes(event_params)
      flash[:notice] = "Successfully updated #{@event.title}"
      redirect_to(admin_path)
    end
  end

  def destroy
    @event = Event.find_by(title: params[:title])
    @event.customers.destroy
    @event.destroy
    flash[:notice] = "Successfully deleted #{@event.title}"
    redirect_to(admin_path)
  end

  private

  def confirm_logged_in
    unless session[:user_id]
      redirect_to(root_path)
    end
  end

  def event_params
    params.require(:event).permit(:title, :date, :description, :price, :capacity, :visible)
  end

end

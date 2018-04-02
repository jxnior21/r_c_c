class MainController < ApplicationController
  def index
    @events = Event.all
    @events.each do |event|
      if event.customers.size == event.capacity
        event.update_attributes(:visible => false)
      end
    end
    @future_events = FutureEvent.all
    @customer = Customer.all
  end

  def find_event
    found_event = Event.find(params[:format])
    flash[:notice] = "selected event found"
    flash[:ftitle] = found_event.title
    flash[:id] = found_event.id
    flash[:fprice] = found_event.price
    p flash[:fprice]
    render js: "window.location = '#{root_path}'"
  end

  def formacion
  end

  def evangelizacion
  end

  def rccho
  end

  def checkout
  end

end

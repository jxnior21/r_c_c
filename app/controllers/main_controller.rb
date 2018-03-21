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

  def formacion
  end

  def evangelizacion
  end

  def rccho
  end

  def checkout
  end

end

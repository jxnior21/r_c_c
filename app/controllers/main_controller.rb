class MainController < ApplicationController
  def index
    @events = Event.all
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

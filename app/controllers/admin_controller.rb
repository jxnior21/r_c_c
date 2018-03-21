class AdminController < ApplicationController

  layout 'application'

  before_action :confirm_logged_in, :except => [:attempt_login, :logout]

  def menu
    @counter = Event.last
    @events = Event.all
    @events.each do |event|
      if event.customers.size == event.capacity
        event.update_attributes(:visible => false)
      end
    end
    @future_events = FutureEvent.all
    @customers = Customer.all
  end

  def attempt_login

    if params[:username].present? && params[:password].present?
      found_user = AdminUser.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "You are now logged in"
      redirect_to(admin_path)
    else
      redirect_to(root_path)
      flash[:notice] = "Invalid username or password"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to(root_path)
  end

  private

  def confirm_logged_in
    unless session[:user_id]
      redirect_to(root_path)
    end
  end

end

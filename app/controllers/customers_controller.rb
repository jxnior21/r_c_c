class CustomersController < ApplicationController

  def create
    @customer = Customer.new(customer_params)
    eventid = @customer.event_id
    event = Event.find(eventid)
    price = event.price
    fprice = price.to_i
    if @customer.save && price == 0
      flash[:notice] = "Free registered"
      flash[:title] = event.title
      flash[:name] = @customer.first_name + " " + @customer.last_name
      flash[:email] = @customer.email
      flash[:price] = fprice
      flash[:date] = event.date
      redirect_to(root_path)
    elsif @customer.save
      charge = price.gsub(/[.]/, '')
      charge = charge.to_i
      Stripe.api_key = "sk_test_Uqgr2je9Z41t0un6gLuCB7bQ"
      token = params[:stripeToken]
      charge = Stripe::Charge.create(
        :amount => charge,
        :currency => "usd",
        :description => event.title + ": " + @customer.first_name + " " + @customer.last_name,
        :statement_descriptor => event.title,
        :source => token,
        :receipt_email => @customer.email,
      )
      flash[:notice] = "Registered"
      flash[:title] = event.title
      flash[:name] = @customer.first_name + " " + @customer.last_name
      flash[:email] = @customer.email
      flash[:price] = fprice
      flash[:date] = event.date
      redirect_to(root_path)
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :telephone, :address1, :email, :city, :state, :zip, :church, :gender, :first_name2, :last_name2, :relationship, :telephone2, :event_id)
  end

end

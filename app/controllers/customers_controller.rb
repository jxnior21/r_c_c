class CustomersController < ApplicationController

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      eventid = @customer.event_id
      event = Event.find(eventid)
      price = event.price
      price.gsub!(/[.]/, '')
      price = price.to_i
      Stripe.api_key = "sk_test_TrpgQwklpivgZpc4q7QPCtbj"
      token = params[:stripeToken]
      charge = Stripe::Charge.create(
        :amount => price,
        :currency => "usd",
        :description => "Renovacion Carismatica: " + @customer.first_name + " " + @customer.last_name,
        :statement_descriptor => event.title,
        :source => token,
      )
      redirect_to(main_checkout_path)
    end
  end

  def delete
    @customer = Customer.find(params[:id])
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    flash[:notice] = "Successfully deleted future event"
    redirect_to(admin_path)
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :telephone, :address1, :address2, :city, :state, :zip, :church, :gender, :first_name2, :last_name2, :relationship, :telephone2, :event_id)
  end

end

include Amount
class ChargesController < ApplicationController
  def create
    #amount in cents
    @amount = 1500
    
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
      )
      
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: Amount.default,
      description: "Blocipedia Premium Membershp - #{current_user.email}",
      currency: 'usd'
      )
      
    flash[:notice] = "Thanks for joining Blocipedia, #{current_user.email}!"
    redirect_to root_path(current_user)
    
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
    
  end
  
  def new
   @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Blocipedia premium membership - #{current_user.email}",
     amount: Amount.default
   }
  end
  
end
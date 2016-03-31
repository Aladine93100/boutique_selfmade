class ChargesController < ApplicationController
	def create
      @product = Product.find(params[:product_id])

      # Amount is in cents
      @amount = @product.price
      @amount = @amount.to_i

      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => @product.title,
        :currency    => 'eur'
      )

  rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end
end

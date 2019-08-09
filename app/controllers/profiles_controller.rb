class ProfilesController < ApplicationController

  def index
  end

  def me
  	 @customer = Customer.find(current_customer.id)
  	 @orders = @customer.orders
  end

end

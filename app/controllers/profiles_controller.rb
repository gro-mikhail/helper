# frozen_string_literal: true

class ProfilesController < ApplicationController
  def index; end

  def me
    if current_customer
      @customer = Customer.find(current_customer.id)
      @orders = @customer.orders
    elsif current_worker
      @worker = Worker.find(current_worker.id)
      @orders = Order.where(worker_id: @worker.id)
   end
  end
end

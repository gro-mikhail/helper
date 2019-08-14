class ResponseToOrdersController < ApplicationController
  def create
    @response_to_order = ResponseToOrder.new(response_to_order_params)
    @response_to_order.save

  end

  private

  def  response_to_order_params
      params.permit(:worker_id, :order_id)
  end
end

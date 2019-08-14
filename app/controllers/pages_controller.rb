# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @orders = Order.all
    @response_to_orders = ResponseToOrder.all
  end
end

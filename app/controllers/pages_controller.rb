# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @orders = Order.all
  end
end

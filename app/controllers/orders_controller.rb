# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.where(customer_id: params[:customer_id])
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @workers = Worker.joins(:response_to_orders).where(response_to_orders: { order_id: params[:id]})
  end

  # GET /orders/new
  def new
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.new
  end

  # GET /orders/1/edit
  def edit; end

  # POST /orders
  # POST /orders.json
  def create
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to profile_url, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def complete
    @order = Order.find(params[:id])
    @order.order_completed!
  end

  def confirm
    @order = Order.find(params[:id])
    @order.update_attribute(:worker_id, params[:worker_id])
    @order.order_in_progress!
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to profile_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:title, :description, :address, :price, :customer_id, images: [])
  end
end

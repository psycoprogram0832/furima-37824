class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new
  end

  def new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_params)
    # binding.pry
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :phone_number,:address, :building,).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if 
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :image, :introduction, :price, :condition_id, :shipment_id,:category_id, :prefecture_id, :delivery_charge_id,).merge(user_id: current_user.id)
  end
end

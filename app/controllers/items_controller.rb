class ItemsController < ApplicationController

  def new
    @prefecture = Prefecture.all
    @item = Item.new
  end

  def show
    
  end

  def create
    @item = Item.new(item_params)
    # binding.pry
    @item.save
  end
  
  def pay

  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :price, :status, :delivery_fee, :user_id, :category_id, :bland_id)
  end
end
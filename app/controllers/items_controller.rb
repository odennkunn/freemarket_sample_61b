class ItemsController < ApplicationController

  def new
    @prefecture = Prefecture.all
    @item = Item.new
    @item.build_category
  end

  def show
    
  end

  def create
    @item = Item.new(item_params)
    binding.pry
    @item.save
    redirect_to root_path
  end
  
  def pay

  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :price, :size, :status, :delivery_fee, :category_id, :delivery_way, :delivery_day, image_attributes: [:item_id, :image])
  end
end
class ItemsController < ApplicationController

  def new
    @prefecture = Prefecture.all
    @item = Item.new
    @item.images.build
  end

  def show
    
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path
    end
  end
  
  def pay

  end

  private
  def item_params
    params.require(:item).permit(:name, 
                                 :explanation,
                                 :price, 
                                 :size, 
                                 :status,
                                 :delivery_fee, 
                                 :category_id, 
                                 :user_id,
                                 :bland_id,
                                 :delivery_way, 
                                 :delivery_day, 
                                 images_attributes: [:image]).merge(user_id: 1)
  end
end
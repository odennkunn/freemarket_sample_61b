class ItemsController < ApplicationController

  def new
    @prefecture = Prefecture.all
    @item = Item.new
    @item.images.build
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    binding.pry
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end 

  def edit
    @item = Item.find(params[:id])
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(update_item_params)
      redirect_to root_path
    else
      redirect_to edit_item_path
    end
  end
  
  # def destroy
  #   if @item.user_id == current_user.id && @item.destroy
  #     redirect_to root_path
  #   else
  #     redirect_to action: :show
  #   end
  # end

  def pay

  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
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
                                 :prefecture_id,
                                 images_attributes: [:image]).merge(user_id: 1)
  end

  def update_item_params
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
                                 :prefecture_id,
                                 [images_attributes: [:image, :_destory, :id]]).merge(user_id: 1)
                                #  user_idをcurrent_userに変更する
  end
end
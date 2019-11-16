class ItemsController < ApplicationController

  def new
    @prefecture = Prefecture.all
    @item = Item.new
    @item.images.build
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    # @item.save
    # @item.images.build
    # binding.pry
    if @item.save
      params[:images][:image].each do |image|
        @item.images.create(image: image, item_id: @item.id)
      end
      respond_to do |format|
        format.json
        format.html{redirect_to signup_index_path}
      end
      # redirect_to signup_index_path
      # respond_to do |format|
      #   format.json{redirect_to root_path}
      # end
      # image_params[:images].each do |image|
      #   @item.images.build
      #   item_image = @item.images.new(image: image)
      #   item_image.save
      # end
    #   respond_to do |format|
    #     format.json
    #   end
    #   redirect_to root_path
    # else
      # @item.images.build
      # redirect_to new_item_path
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end 

  def edit
    @item = Item.find(params[:id])
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
                                 images_attributes: [:image]).merge(user_id: current_user.id)
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
                                 images_attributes: [:image, :_destory, :id]).merge(user_id: current_user.id)
                                #  user_idをcurrent_userに変更する
  end

  # def image_params
  #   params.require(:images).permit({:images => []})
  # end
end
class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_item, only: [:show, :edit, :update, :destroy, :pay, :buy, :buy_success]
  before_action :credit_cards_info, only: [:pay, :buy_success]
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


  def edit
    @item = Item.find(params[:id])
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def update
    if @item.update(update_item_params)
      redirect_to root_path
    else
      redirect_to edit_item_path
    end
  end
  
  def destroy
    if @item.user_id == current_user.id && @item.destroy
      redirect_to root_path
    else
      redirect_to action: :show
    end
  end

  def pay
  end

  def buy
    card = CreditCard.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.aws[:payjp_private_key]
    if Payjp::Charge.create(
      amount: @item.price,
      customer: card.customer_id,
      currency: 'jpy'
    )
    @item.update(buyer_id: current_user.id)
      redirect_to "/items/buy_success/#{@item.id}"
    else
      redirect_to "/items/pay/#{@item.id}"
    end
  end

  def buy_success
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
                                 [images_attributes: [:image, :_destory, :id]]).merge(user_id: current_user.id)
                                #  user_idをcurrent_userに変更する
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def credit_cards_info
    @card = current_user.credit_cards
    Payjp.api_key = Rails.application.credentials.aws[:payjp_private_key]
    card = @card[0]
    customer = Payjp::Customer.retrieve(card.customer_id)
    @card = customer.cards.retrieve(card.card_id)
    return @card
  end

end
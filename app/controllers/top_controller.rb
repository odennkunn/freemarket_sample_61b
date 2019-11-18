class TopController < ApplicationController
  before_action except: [:search]

  def index
    @items = Item.all
    @images = Image.all
  end

  def search
    @images = Image.all
    if params[:search].length != 0
      @items = Item.where('name LIKE(?)',"%#{params[:search]}%")
    else
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path
    end
  end
end

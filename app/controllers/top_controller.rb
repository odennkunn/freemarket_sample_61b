class TopController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
    @images = Image.all
  end
end

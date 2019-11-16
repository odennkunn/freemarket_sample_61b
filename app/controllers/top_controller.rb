class TopController < ApplicationController
  def index
    # @items = Item.all
    @items = Item.order('id ASC').limit(20)
    # binding.pry
    # item = Item.where()
    # binding.pry
    # @image = @items.images.find(0)
  end
end

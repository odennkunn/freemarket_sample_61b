class ItemsController < ApplicationController

  def new
    @prefecture = Prefecture.all
  end
  
  
end

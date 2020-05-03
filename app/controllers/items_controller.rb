class ItemsController < ApplicationController
  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    #@image= @item.images.build
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end

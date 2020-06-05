class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show,:destroy]
  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show

  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_update_params)
    if @item
      redirect_to root_path
    else 
      render edit
    end
      # if  @item.update_attributes(item_update_params)
        #  redirect_to "/"
      # else
        # render action: :edit
      # end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else 
      render show
    end
  end

  def set_item
    @item = Item.find(params[:id]) 
  end

  private
  def item_params
     params.require(:item).permit(:name, :price, :introduction, :category_id, :item_condition, :brand_id, :shipping_area, :preparation_day, :trading_status, :postage_type, images_attributes: [:url]).merge(user_id: current_user.id)
  end
  
  def item_update_params
    params.require(:item).permit(:name, :price, :introduction, :category_id, :item_condition, :brand_id, :shipping_area, :preparation_day, :trading_status, :postage_type, images_attributes: [:url, :id, :_destroy]).merge(user_id: current_user.id)
      
  end

  
end

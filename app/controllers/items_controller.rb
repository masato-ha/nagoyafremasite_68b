class ItemsController < ApplicationController
  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @image = @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      #params[:images]['image'].each do |img|
      #  @item_image = @item.item_images.create(:image => img, :item_id => @item.id)
      #end
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :introduction, :category_id, 
      :item_condition, :brand_id, :shipping_area, :preparation_day, :trading_status, images_attributes: [:url])
    #params.require(:item).permit(:name, :price, :images, :introduction, item_condition: [])
    #params.require(:item).permit(item_images_attributes: [:id, :item_id, :image,])
  end

end

class ItemsController < ApplicationController
  def index
    @items = Item.includes(:images).order('created_at DESC')
    #@parents = Category.where(ancestry: nil)
  end

  def new
    @item = Item.new
    @item.images.new
    #セレクトボックスの初期値設定
    @category_parent_array = []
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).limit(13).each do |parent|
       @category_parent_array << parent
    end
  end

   # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    @category_children = Category.where(ancestry: "#{params[:parent_id]}")
    #親カテゴリーに紐付く子カテゴリーを取得
  end

   # 子カテゴリーが選択された後に動くアクション
  def category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
    #子カテゴリーに紐付く孫カテゴリーの配列を取得
  end


  def create
    @item = Item.new(item_params)
    if @item.save
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
    params.require(:item).permit(:name, :price, :introduction, :category_id, :item_condition, :brand_id, :shipping_area, :preparation_day, :trading_status, images_attributes: [:url])
  end

  def show
  end
end

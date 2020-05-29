class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show,:destroy,:purchase,:pay]
  before_action :set_card, only: [:purchase,:pay]
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
  end

  def update
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else 
      render show
    end
  end
  def purchase
    if creditCard.blank?
      redirect_to controller: 'credit_cards', action: 'new'
    else
      Payjp.api_key = Rails.application.credentials.payjp[:payjp_secret_key]
      customer = Payjp::Customer.retrieve(creditCard.customer_id)
      @default_card_information = customer.cards.retrieve(creditCard.card_id)
    end
    
    
  end

  def pay
    Payjp.api_key = Rails.application.credentials.payjp[:payjp_secret_key]
    Payjp::Charge.create(
    :amount => @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    :customer => creditCard.customer_id, #顧客ID
    :currency => 'jpy', #日本円
  )
  redirect_to controller: 'items', action: 'index' #完了画面に移動
  end

  def done
  
  end
  def set_item
    @item = Item.find(params[:id]) 
  end

  def set_card
    creditCard = CreditCard.where(user_id: current_user.id).first
  end

  private
  def item_params
     params.require(:item).permit(:name, :price, :introduction, :category_id, :item_condition, :brand_id, :shipping_area, :preparation_day, :trading_status, :postage_type, images_attributes: [:url]).merge(user_id: current_user.id)
  end

  

end

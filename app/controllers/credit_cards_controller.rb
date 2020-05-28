class CreditCardsController < ApplicationController
  require "payjp"
  def index
    
  end

  def new
    creditCard = CreditCard.where(user_id: current_user.id)
    redirect_to action: "show" if creditCard.exists?
    
  end

  def create #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = Rails.application.credentials.payjp[:payjp_secret_key]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      email: current_user.email, #なくてもOK
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @creditCard = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @creditCard.save
        redirect_to credit_card_path(:id)
      else
        redirect_to action: "create"
      end
    end
  end

 def destroy #PayjpとCardデータベースを削除します
  creditCard = CreditCard.where(user_id: current_user.id).first
    if creditCard.blank?
    else
      Payjp.api_key = Rails.application.credentials.payjp[:payjp_secret_key]
      customer = Payjp::Customer.retrieve(creditCard.customer_id)
      customer.delete
      creditCard.delete
    end
      redirect_to action: "new"
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    creditCard = CreditCard.where(user_id: current_user.id).first
    if creditCard.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = Rails.application.credentials.payjp[:payjp_secret_key]
      customer = Payjp::Customer.retrieve(creditCard.customer_id)
      @default_card_information = customer.cards.retrieve(creditCard.card_id)
    end
  end
  
end

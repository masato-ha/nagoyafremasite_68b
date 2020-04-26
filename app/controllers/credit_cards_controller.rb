class CreditCardsController < ApplicationController
  def index
    @CreditCards=CreditCard.all
    @CreditCard=CreditCard.new
  end
  def new
    @CreditCard=CreditCard.new
  end
end

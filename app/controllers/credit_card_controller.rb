class CreditCardController < ApplicationController

  require "payjp"

  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exusts?
  end

  def payjp
    Payjp.api_key = "sk_test_bd8c841107b0a0f966a79cc5"
    if params['payjp-token'].blank?
      redirect_to action: "new"
    begin
      customer = 
    rescue => exception
      
    else
      
    end
  

  def show
  end
end

class CreditCardController < ApplicationController

  require "payjp"

  def new
    # credit_card = Credit_card.where(user_id: current_user.id)
    # redirect_to action: "show" if card.exusts?
  end

  def show
  end
end

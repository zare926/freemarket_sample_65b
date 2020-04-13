class PurchaseController < ApplicationController

  require 'payjp'
  before_action :set_item
  before_action :set_address, only: [:index]

  def index
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => @items.price,
    :customer => card.customer_id,
    :currency => 'jpy',
    )
    redirect_to action: 'done', items_id: @items
  end

  def done
    Purchase.create(item_id: @items.id, user_id: current_user.id)
  end

  def set_item
    @items = Item.find(params[:items_id])
    @images = @items.images
  end

  def set_address
    @addresses = Address.find_by(user_id: current_user.id)
  end

  
  

end

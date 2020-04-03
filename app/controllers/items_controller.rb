class ItemsController < ApplicationController
  before_action :set_item, only: [:show]
  def index
  end

  def new
    @item = Item.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @items = Item.where(id: params[:id])
    @images = @item.images

  end

  def confirm
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :brand, :state, :status, :postage, :shipping_date, :category)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end
end

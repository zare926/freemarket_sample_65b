class ItemsController < ApplicationController
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
  end

  def confirm
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :brand, :status, :status, :postage, :shipping_date, :brand)
  end
  
end

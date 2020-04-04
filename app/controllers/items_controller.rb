class ItemsController < ApplicationController
  def index
    @categories = Category.all
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
    @items = Item.find(params[:id])
  end

  def confirm
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :brand, :state, :status, :postage, :shipping_date, :category)
  end

  def category_params
    params.require(:category).permit(:name)
  end
  
end

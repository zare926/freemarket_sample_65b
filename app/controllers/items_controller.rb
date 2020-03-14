class ItemsController < ApplicationController
  def index
  end

  def new
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
    @item = Item.find(params[:id])
    @images = @item.images
    # binding.pry
  end

  def confirm
  end
  
end

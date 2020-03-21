class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    respond_to do |format|
      format.html { redirect_to :root }
      format.json { render json: @item}
    end
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
  
end

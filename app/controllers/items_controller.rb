class ItemsController < ApplicationController
  before_action :set_item, only: [:show,:edit,:destroy]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @items = Item.where(status: false).limit(3).order("created_at DESC")
    @items_brand = Item.where(status: false).where(brand: "Off-White").limit(3).order("created_at DESC")
    @images = Image.all
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
    if @items.update(item_params)
      redirect_to item_path(@items.id)
    else
      render :edit
    end
  end

  def destroy
    if @items.destroy
      redirect_to user_path
    else
      render :show
    end
  end

  def show
    @images = @items.images
    @categories = Category.all
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
  
  def set_item
    @items = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end

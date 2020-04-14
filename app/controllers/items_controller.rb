class ItemsController < ApplicationController
  before_action :set_item, only: [:show,:edit]
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @items = Item.where(status: false).limit(3).order("created_at DESC")
    @items_brand = Item.where(status: false).where(brand: "Off-White").limit(3).order("created_at DESC")
    @images = Image.all
    @categories = Category.all
  end

  
  def new
    @item = Item.new
    @item.images.new
    @category = Category.all.order("id ASC").limit(1)
  end

  def create
    @item = Item.new(item_params)
    respond_to do |format|
      format.html
      format.json
    end
    if @item.save
      redirect_to root_path and return
    else
      redirect_to new_item_path and return
    end
  end

  def edit
  end

  def update
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  def show
    @images = @items.images
    @categories = Category.all
  end

  def confirm
  end

  def get_category_children
    @category_children = Category.find(params[:productcategory]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:productcategory]).children
  end

  private

  def item_params
    params.require(:item).permit(
                                  :name,
                                  :description,
                                  :brand,
                                  :state,
                                  :postage,
                                  :prefecture,
                                  :shipping_date,
                                  :category_id,
                                  :price,
                                  :size,
                                  item_images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id,status: 0)
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

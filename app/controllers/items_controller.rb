class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @category_parent_array = ["選択してください"]
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end
  end

  def create
    @item = Item.create(item_params)
    @item.images.new
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

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :brand, :state, :status, :postage, :shipping_date, :category, :price, images_attributes: [:src], images_attributes: [:ancestry])
  end
  
end

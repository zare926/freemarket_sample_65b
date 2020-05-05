class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]
  before_action :edit_item, only: [:edit, :update]
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @items = Item.where(buyer_id: nil).limit(3).order("created_at DESC")
    @items_brand = Item.where(buyer_id: nil).where(brand: "Off-White").limit(3).order("created_at DESC")
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
    grandchild_category = @item.category # 孫のレコード取得
    child_category = grandchild_category.parent # 子のレコードを取得

    @category_parent_array = [] # 空の親の配列を作成
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_children_array = [] # 空の子の配列を作成
    Category.where(ancestry: child_category.ancestry).each do |child|
      @category_children_array << child
    end

    @category_grandchildren_array = [] # 空の孫の配列を作成
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchild|
      @category_grandchildren_array << grandchild
    end
  end

  def update
    respond_to do |format|
      format.html
      format.json
    end
    if @item.update(item_params)
      redirect_to item_path(@item.id)
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
                                  images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id,status: 0)
  end
  
  def set_item
    @items = Item.find(params[:id])
  end

  def edit_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end

class ItemsController < ApplicationController
  before_action :move_to_loginpage
  before_action :set_item, only: [:pause_listing, :edit, :show, :update]

  def index
  end

  def new
    @item = Item.new
    @item.item_images.build
  end

  def create
    item_brand = Brand.find_or_create_by(name: params[:brand_name], category_id: params[:item][:big_category_id])
    @item = Item.new(item_params.merge({status_id: 1, brand_id: item_brand.id}))
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path
    end
  end

  def show
  end

  def destroy
    redirect_to root_path, notice: "削除機能実装時に修正します"
  end

  def edit
  end

  def update
    redirect_to root_path unless @item.seller_id === current_user.id
    item_brand = Brand.find_or_create_by(name: params[:brand_name], category_id: params[:item][:big_category_id])
    @item.update!(item_params.merge({status_id: 1, brand_id: item_brand.id})) if @item.seller_id === current_user.id
    render :show
    if @item.update(item_params.merge({status_id: 1, brand_id: item_brand.id}))
      render :show
    else
      redirect_to edit_item_path(@item)
    end
  end

  def purchase
    redirect_to root_path, notice: "購入画面実装時に修正します"
  end

  def pause_listing
    if params[:exhibit] === "true"
      @item.update(exhibit_flag: true)
      redirect_to item_path(@item), notice: "出品の再開をしました"
    else
      @item.update(exhibit_flag: false)
      redirect_to item_path(@item), notice: "出品の一旦停止をしました"
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description ,:big_category_id , :middle_category_id, :small_category_id, :size_id, :condition_id, :shipping_cost_id, :shipping_method_id, :sender_prefecture, :days_for_shipment_id, :status_id, :price, item_images_attributes: [:image, :id]).merge(seller_id: current_user.id)
  end

  def move_to_loginpage
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

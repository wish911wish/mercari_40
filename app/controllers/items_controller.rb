class ItemsController < ApplicationController
  before_action :move_to_loginpage
  before_action :set_item, only: :pause_listing

  def index
  end

  def new
    @item = Item.new
    @item.item_images.build
  end

  def create
    @item = Item.new(item_params.merge(status_id: 1))
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
    if current_user.present?
      user = User.find(current_user.id)
      @user_image = user.image
    else
      @user_image = "member_photo_noimage_thumb.png"
    end
  end

  def destroy
    if Item.find(params[:id]).present?
      item = Item.find(params[:id])
      item.destroy
      redirect_to users_path, notice: "商品を削除しました"
    else
      redirect_to root_path
    end
  end

  def edit
    redirect_to root_path, notice: "編集画面実装時に修正します"
  end

  def purchase
    redirect_to root_path, notice: "購入画面実装時に修正します"
  end

  def search
    Item
    @item = Item.all
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
    params.require(:item).permit(:name, :description ,:big_category_id , :middle_category_id, :small_category_id, :brand_id, :size_id, :condition_id, :shipping_cost_id, :shipping_method_id, :sender_prefecture, :days_for_shipment_id, :status_id, :price, item_images_attributes: [:image]).merge(seller_id: current_user.id)
  end

  def move_to_loginpage
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end

class ItemsController < ApplicationController
  before_action :move_to_loginpage

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
  end

  def destroy
    redirect_to root_path, notice: "削除機能実装時に修正します"
  end

  def edit
    redirect_to root_path, notice: "編集画面実装時に修正します"
  end

  def purchase
    redirect_to root_path, notice: "購入画面実装時に修正します"
  end

  def pause_listing
    redirect_to root_path, notice: "いいねボタン実装時に修正します"
  end

  private
  def item_params
    params.require(:item).permit(:name, :description ,:big_category_id , :middle_category_id, :small_category_id, :brand_id, :size_id, :condition_id, :shipping_cost_id, :shipping_method_id, :sender_prefecture, :days_for_shipment_id, :status_id, :price, item_images_attributes: [:image]).merge(seller_id: current_user.id)
  end

  def move_to_loginpage
    redirect_to new_user_session_path unless user_signed_in?
  end
end

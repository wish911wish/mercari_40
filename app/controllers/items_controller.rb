class ItemsController < ApplicationController
  before_action :move_to_loginpage
  before_action :set_item, only: [:pause_listing, :edit, :show, :update]

  require 'payjp'

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
    @item = Item.find(params[:id])
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
  end

  def update
    redirect_to root_path unless @item.seller_id === current_user.id
    item_brand = Brand.find_or_create_by(name: params[:brand_name], category_id: params[:item][:big_category_id])
    if @item.update(item_params.merge({status_id: 1, brand_id: item_brand.id}))
      ItemImage.destroy_all(item_id: params[:id],image: nil)
      @item = Item.find(params[:id])
      render :show
    else
      redirect_to edit_item_path(@item)
    end
  end

  def purchase
    @item = Item.find(params[:item_id])
    # redirect_to root_path, notice: "購入画面実装時に修正します"
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    item = Item.find(params[:item_id])
    item_price = item.price
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => item_price, # amount should replace valiables of item fee
    :customer => card.customer_id,
    :currency => 'jpy',
  )
  redirect_to action: 'done'
  end

  def done
    @item = Item.find(params[:item_id])
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
    params.require(:item).permit(:name, :description ,:big_category_id , :middle_category_id, :small_category_id, :size_id, :condition_id, :shipping_cost_id, :shipping_method_id, :sender_prefecture, :days_for_shipment_id, :status_id, :price, :item_id, item_images_attributes: [:image, :id, :remove_image]).merge(seller_id: current_user.id)
  end

  def move_to_loginpage
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

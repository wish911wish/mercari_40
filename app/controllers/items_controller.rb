class ItemsController < ApplicationController
  before_action :move_to_loginpage, except: [:detail_search, :search]
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

  def search
    @item = Item.all.order("created_at DESC")
  end

  def detail_search
    search_condition = {}

    if params[:small_category_id].present?
      search_condition[:small_category_id] = params[:small_category_id].keys
    end

    if params[:brand_name].present?
      brand = Brand.find_by(name: params[:brand_name])
      search_condition[:brand_id] = brand.id if brand.present?
    end

    if params[:size_id].present?
      search_condition[:size_id] = params[:size_id].keys
    end

    if params[:condition_id].present?
      search_condition[:condition_id] = params[:condition_id].keys
    end

    if params[:shipping_cost_id].present?
      search_condition[:shipping_cost_id] = params[:shipping_cost_id].keys
    end

    if params[:status_id].present?
      search_condition[:status_id] = params[:status_id].keys
    end

    if params[:price_min].present? && params[:price_max].present? && params[:price_min] <= params[:price_max]
      search_condition[:price] = params[:price_min]..params[:price_max]
      @item = Item.where(search_condition)
    elsif params[:price].present?
      @item = Item.where(search_condition).where(get_price_range)
    else
      @item = Item.where(search_condition)
    end

    if params[:keyword].present?
      search_with_keyword
    end

    if params[:sort_order] === "favorites"
      @item = @item.joins(:favorites).group(:item_id).order('count(item_id) desc')
    else
      @item = @item.order(params[:sort_order])
    end
    render :search
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

  def get_price_range
    prices = params[:price].split("-")
    if prices.length === 2
      "price BETWEEN #{prices[0]} AND #{prices[1]}"
    else
      "price >= #{prices[0]}"
    end
  end

  def search_with_keyword
    keywords = params[:keyword].split(/[[:blank:]]+/)
    keywords.each do |keyword|
      @item = @item.where("name LIKE ?", "%#{keyword}%").or(Item.where("description LIKE ?", "%#{keyword}%"))
    end
  end
end

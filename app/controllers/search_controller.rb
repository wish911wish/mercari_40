class SearchController < ApplicationController
  before_action :set_item_instance

  def index
    search_with_keyword if params[:keyword].present?

    @item = @item.order("created_at DESC")
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

    @item.order("created_at DESC")
    render :index
  end

  private

  def set_item_instance
    @item = Item.all
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

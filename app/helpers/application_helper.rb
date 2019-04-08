module ApplicationHelper
  def get_big_category_name
  end

  def big_category_name(item)
    Category.find(item.big_category_id).name if item.big_category_id.present?
  end

  def middle_category_name(item)
    Category.find(item.middle_category_id).name if item.middle_category_id.present?
  end

  def small_category_name(item)
    Category.find(item.small_category_id).name if item.small_category_id.present?
  end

  def brand_name(item)
    Brand.find(item.brand_id).name if item.brand_id.present?
  end

  def condition_name(item)
    Condition.find(item.condition_id).name if item.condition_id.present?
  end

  def shipping_cost_name(item)
    ShippingCost.find(item.shipping_cost_id).name if item.shipping_cost_id.present?
  end

  def shipping_method_name(item)
    ShippingMethod.find(item.shipping_method_id).name if item.shipping_method_id.present?
  end

  def days_for_shipment_name(item)
    DaysForShipment.find(item.days_for_shipment_id).name if item.days_for_shipment_id.present?
  end

  def prefecture(item)
    Prefecture.find(item.sender_prefecture).name if item.sender_prefecture.present?
  end

  def status_name(item)
    Status.find(item.status_id).name if item.status_id.present?
  end

  def add_favorite_class(item)
    if @item.favorites.find_by(user_id: current_user.id).present?
      return "active"
    else
      return ""
    end
  end
end

class ItemsController < ApplicationController

  def new
    @item = Item.new
    @item.item_images.build
    # binding.pry
  end

  def create
    binding.pry
    @item = Item.new(item_params.merge(status_id: 1))
    binding.pry
    @item.save
    # if @item.save
    #   redirect_to root_path
    # else
    #   # render :new
    # end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description ,:big_category_id , :middle_category_id, :small_category_id, :brand_id, :size_id, :condition_id, :shipping_cost_id, :shipping_method_id, :sender_prefecture, :days_for_shipment_id, :status_id, :price, item_images_attributes: [:image]).merge(seller_id: current_user.id)
  end

  def image_params1
    params.require(:item).permit(item_images_attributes: [:image])
  end

  def image_params2
    params.require(:item).permit(item_image: [:image])
  end

  def image_params3
    params.require(:item)["item_image"]["image"]
  end

  def image_params4
    params.require(:item)["item_images_attributes"]["0"]["image"]
  end


  # def image_params3
  #   params.require(:item).permit(item_image: [:image])
  # end

  def image_params
    # params.require(:image)
  end

  # def item_image_params
  #   params.require(:item).permit(:name, :description ,:big_category_id , :middle_category_id, :small_category_id, :brand_id, :size_id, :condition_id, :shipping_cost_id, :shipping_method_id, :sender_prefecture, :days_for_shipment_id, :status_id, :price).merge(seller_id: current_user.id)
  # end
end

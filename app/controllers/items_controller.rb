class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    binding.pry
    @item.save
    redirect_to root_path
    # render :new unless @item.save
  end

  private
  def set_item
    @item = EventDecorator.find(params[:id]).decorate
  end

  def item_params
    params.require(:item).permit(:name, :description ,:big_category_id , :middle_category_id, :small_category_id, :brand_id, :size_id, :condition_id, :shipping_cost_id, :shipping_method_id, :sender_prefecture, :days_for_shipment_id, :status_id, :price).merge(seller_id: current_user.id)
  end

end

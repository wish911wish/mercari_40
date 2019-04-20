class TopController < ApplicationController
  def index
    @items = Item.all

    @items_ladies = Item.where(big_category_id: "1").limit(4)
    @section_name_ladies = Category.find(@items_ladies[0].big_category_id).name

    @items_mens = Item.where(big_category_id: "2").limit(4)
    @section_name_mens = Category.find(@items_mens[0].big_category_id).name

    @items_kids = Item.where(big_category_id: "3").limit(4)
    @section_name_kids = Category.find(@items_kids[0].big_category_id).name

  end
end

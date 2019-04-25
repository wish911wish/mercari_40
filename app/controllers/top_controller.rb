class TopController < ApplicationController
  def index
    @items = Item.all

    @items_ladies = Item.where(big_category_id: "1").limit(4)
    @section_name_ladies = Category.find(@items_ladies[0].big_category_id).name

    @items_mens = Item.where(big_category_id: "2").limit(4)
    @section_name_mens = Category.find(@items_mens[0].big_category_id).name

    @items_kids = Item.where(big_category_id: "3").limit(4)
    @section_name_kids = Category.find(@items_kids[0].big_category_id).name

    @items_cosmetics = Item.where(big_category_id: "7").limit(4)
    @section_name_cosmetics = Category.find(@items_cosmetics[0].big_category_id).name

    @items_chanel = Item.where(brand_id: "47").limit(4)
    @section_name_chanel = Brand.find(@items_chanel[0].brand_id).name

    @items_vuitton = Item.where(brand_id: "48").limit(4)
    @section_name_vuitton = Brand.find(@items_vuitton[0].brand_id).name

    @items_supreme = Item.where(brand_id: "49").limit(4)
    @section_name_supreme = Brand.find(@items_supreme[0].brand_id).name

    @items_nike = Item.where(brand_id: "50").limit(4)
    @section_name_nike = Brand.find(@items_nike[0].brand_id).name

  end
end

class CategorySizesController < ApplicationController

  def show
    category_size = Category.find(params[:id]).category_size
    category_size.present? ? @sizes = Size.where(size_group: category_size.size_id) : @sizes = []
  end
end

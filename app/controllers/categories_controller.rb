class CategoriesController < ApplicationController

  def index
    @categories = Category.where(parent: params[:id])
  end

  def get_sizes
    category_size = Category.find(params[:id]).category_size
    category_size.present? ? @sizes = Size.where(size_group: category_size.size_id) : @sizes = []
  end

  def get_size_group
    @sizes = Size.where(size_group: params[:id])
  end
end

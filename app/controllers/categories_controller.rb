class CategoriesController < ApplicationController

  def index
    @categories = Category.where(parent: params[:id])
  end

  def get_sizes
    # @sizes = Category.find(params[:id]).sizes
  end

end

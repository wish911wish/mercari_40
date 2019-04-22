class CategoriesController < ApplicationController

  def show
    @categories = Category.where(parent: params[:id])
  end
end

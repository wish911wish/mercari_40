class FavoritesController < ApplicationController
  def create
    Favorite.create(user_id: current_user.id, item_id: params[:item_id])
    @favorites = Favorite.where(item_id: params[:item_id]).count

  end

  def destroy
    Favorite.find_by(user_id: current_user.id, item_id: params[:item_id]).destroy
    @favorites = Favorite.where(item_id: params[:item_id]).count
  end
end

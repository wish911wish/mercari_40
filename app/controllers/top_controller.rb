class TopController < ApplicationController
  def index
    @items = Item.all
    user = User.find(current_user.id)
    if user.image.nil?
      @user_image = "member_photo_noimage_thumb.png"
    else
      @user_image = user.image
    end
  end
end

class UsersController < ApplicationController

  def index
    if current_user.present?
      user = User.find(current_user.id)
      @user_image = user.image
    else
      @user_image = "member_photo_noimage_thumb.png"
    end
  end

  def profile
  end

  def logout
    if current_user.present?
      user = User.find(current_user.id)
      @user_image = user.image
    else
      @user_image = "member_photo_noimage_thumb.png"
    end
  end

end

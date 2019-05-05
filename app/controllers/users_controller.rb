class UsersController < ApplicationController

  def index
  end

  def profile
  end

  def logout
  end

  def update
    current_user.update(user_params)
    render "./devise/registrations/edit"
  end

  private
  def user_params
    params.require(:user).permit(
        :postal_code,
        :prefectures,
        :city,
        :street_address,
        :building,
      )
  end

end

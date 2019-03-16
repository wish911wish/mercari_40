class SignupController < ApplicationController

  def index
  end

  def sms_confirmation
  end

  def address_registration
    current_user.update(user_params_phone_number)
  end


  def payment_registration
    current_user.update(user_params_address)
  end


  def completion
  end

  private
  def user_params_phone_number
    params.require(:user).permit(:phone_number)
  end

  def user_params_address
    params.require(:user).permit(:postal_code, :prefectures ,:city ,:street_address, :building)
  end
end

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  # callback for facebook
  def facebook
    callback_from :facebook
  end

  # callback for twitter
  def twitter
    callback_from :twitter
  end

  # callback for google
  def google_oauth2
    callback_from :google
  end

  private

  def callback_from(provider)
    provider = provider.to_s
    @user = User.find_for_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in_and_redirect @user, event: :authentication
    else
      session[:nickname] = @user.nickname
      session[:email] = @user.email
      session[:password] = @user.password
      session[:provider] = @user.provider
      session[:uid] = @user.uid
      session[:image] = @user.image
      redirect_to new_user_registration_path
    end
  end

end

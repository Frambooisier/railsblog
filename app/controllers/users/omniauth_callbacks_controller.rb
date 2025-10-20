class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def steam
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Steam') if is_navigational_format?
    else
      session['devise.steam_data'] = request.env['omniauth.auth'].except(:extra)
      redirect_to new_user_registration_url, alert: 'Could not authenticate via Steam.'
    end
  end
end

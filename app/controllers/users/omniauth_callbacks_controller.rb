class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  skip_before_action :verify_authenticity_token, only: :facebook

  def facebook
    # implement the 'from_omniauth' method in user model
    # All info. retrieved from facebook is recieved as hash in request.env["omniauth.auth"]
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      # Removing extra as it can overflow
      session["devise.facebook_data"] = request.env["omniauth.auth"].except(:extra)
      set_flash_message(:notice, :exist, kind: "Facebook")
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end

end
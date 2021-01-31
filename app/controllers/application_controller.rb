class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username, :password, :full_name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :username, :full_name, :about])
  end
  
  def after_sign_in_path_for(resource)
    home_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

end

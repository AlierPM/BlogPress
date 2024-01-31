class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[name bio email password password_confirmation posts_counter])

    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[email password password_confirmation current_password])

    devise_parameter_sanitizer.permit(:sign_in, keys: %i[name email password])

    devise_parameter_sanitizer.permit(:reset_password, keys: %i[email reset_password_token])
  end
end

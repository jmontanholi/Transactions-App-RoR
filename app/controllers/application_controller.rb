class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :email, :bio, :photo, :password) }

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:full_name, :email, :bio, :photo, :password, :current_password)
    end
  end
end

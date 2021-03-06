class ApplicationController < ActionController::Base
  add_flash_types :succes, :error, :warning, :message
  protect_from_forgery prepend: true

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end

  def after_sign_up_path_for(_resource)
    categories_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to categories_path, alert: exception.message
  end
end

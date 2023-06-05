class ApplicationController < ActionController::Base
  include Pundit::Authorization

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :country, :email, :role, :password, :password_confirmation, :policy)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :country, :password, :current_password, :policy)}
    end
end
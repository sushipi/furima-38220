class ApplicationController < ActionController::Base
  before_action :basic_auth if Rails.env.production?
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :encrypted_password, :family_name, :given_name, :family_name_kana, :given_name_kana, :birth_date])
  end
end

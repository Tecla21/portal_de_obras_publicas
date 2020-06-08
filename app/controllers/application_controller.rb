class ApplicationController < ActionController::Base
  before_action :set_locale

  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pagy::Backend

  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    { locale: I18n.locale }.merge options
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :iban, :cellphone, :business_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :iban, :cellphone, :service_tax, :business_name])
  end
end

class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :iban, :cellphone, :business_name)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :iban, :cellphone, :service_tax, :business_name)
  end
end

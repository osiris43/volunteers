class RegistrationsController < Devise::RegistrationsController
  def create
    super
  end

  protected
  def after_sign_up_path_for(resource)
    after_signup_path(:add_organization) 
  end
  private
  
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :address1, :address2, :city, :state, :zip, :phone, :dob)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :address1, :address2, :city, :state, :zip, :phone, :dob)
  end
end

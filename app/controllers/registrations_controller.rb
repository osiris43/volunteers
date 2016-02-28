class RegistrationsController < Devise::RegistrationsController
  def create
    super
  end

  protected
  def after_sign_up_path_for(resource)
    after_signup_path(:add_organization) 
  end
  private
  
  #def after_sign_in_path_for(resource_or_scope)
  #  redirect_to :dashboard_root and return
  #end

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end

class RegistrationsController < Devise::RegistrationsController
  #protected
  #def after_sign_up_path_for(resource)
    
  #end
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

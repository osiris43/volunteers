class AfterSignupController < ApplicationController
  include Wicked::Wizard

  steps :add_organization

  def show
    @user = current_user
    @organizations = Organization.all
    @organization = Organization.new
    render_wizard
  end

  def update
    @user = current_user
    org = Organization.find(after_signup_params[:organization_ids])
    @user.add_role('volunteer', org)
    @user.update(after_signup_params)
    finish_wizard_path
  end

  def finish_wizard_path
    redirect_to users_show_path(current_user)
  end

  private
  def after_signup_params
    params.require(:user).permit(:organization_ids)
  end
end

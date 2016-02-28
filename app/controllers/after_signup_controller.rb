class AfterSignupController < ApplicationController
  include Wicked::Wizard

  steps :add_organization

  def show
    @user = current_user
  end

  def finish_wizard_path
    user_path(current_user)
  end
end

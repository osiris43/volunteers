class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if current_user.admin?
      @users = current_user.organization.regular_users
      render 'index_admin'
    else
      @activities = Activity.all
      @volunteer_hours = current_user.volunteer_activities
      render 'index'
    end

  end
end

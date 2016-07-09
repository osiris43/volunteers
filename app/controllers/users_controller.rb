class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @monthChange = 0
    @quarterChange = 0

    if current_user.admin?
      @users = current_user.organization.regular_users

      render 'show_admin'
    else
      @activities = Activity.all
      @volunteer_hours = current_user.volunteer_activities
      render 'show'
    end
  end

  def index
    @users = current_user.organization.regular_users
    @users.to_json
  end
end

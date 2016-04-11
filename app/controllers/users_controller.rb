class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @activities = Activity.all
    @volunteer_hours = current_user.volunteer_activities
  end
end

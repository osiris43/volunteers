class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @activities = Activity.all
    @volunteer_hours = current_user.volunteer_activities

    if current_user.admin?
      @monthsHours = VolunteerActivity.current_month_hours(current_user.organizations.first)
      @lastMonth = VolunteerActivity.last_month_hours(current_user.organizations.first)
      @monthChange = (@monthsHours - @lastMonth) / @lastMonth * 100
      @monthChange = (@monthChange*20).round / 20.0

      @quarterHours = VolunteerActivity.current_quarter_hours(current_user.organizations.first)
      @lastQuarter = VolunteerActivity.last_quarter_hours(current_user.organizations.first)
      @quarterChange = (@quarterHours - @lastQuarter) / @lastQuarter* 100
      @quarterChange = (@quarterChange*20).round / 20.0
      
      @users = current_user.organizations.first.regular_users
    end
  end

  def index
    @users = current_user.organizations.first.regular_users
    @users.to_json
  end
end

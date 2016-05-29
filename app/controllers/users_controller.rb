class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @activities = Activity.all
    @volunteer_hours = current_user.volunteer_activities
    @monthChange = 0
    @quarterChange = 0

    if current_user.admin?
      @monthsHours = VolunteerActivity.current_month_hours(current_user.organization)
      @lastMonth = VolunteerActivity.last_month_hours(current_user.organization)
      @monthChange = (@monthsHours - @lastMonth) / @lastMonth * 100 unless @lastMonth == 0
      @monthChange = (@monthChange*20).round / 20.0

      @quarterHours = VolunteerActivity.current_quarter_hours(current_user.organization)
      @lastQuarter = VolunteerActivity.last_quarter_hours(current_user.organization)
      @quarterChange = (@quarterHours - @lastQuarter) / @lastQuarter * 100 unless @lastQuarter == 0
      @quarterChange = (@quarterChange*20).round / 20.0
      
      @users = current_user.organization.regular_users
    end
  end

  def index
    @users = current_user.organization.regular_users
    @users.to_json
  end
end

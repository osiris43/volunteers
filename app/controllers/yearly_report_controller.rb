class YearlyReportController < ApplicationController
  def index
    @activities = current_user.organization.yearly_report
    @year_start = Date.today.beginning_of_year
    @year_end = Date.today.end_of_year
  end
end
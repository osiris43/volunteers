class VolunteerActivitiesController < ApplicationController
  def create
    data = volunteer_activity_params
    activity = Activity.find(data[:activity])
    org = current_user.organization
    dateparts = data[:date].split('/')
    fixed_date = "#{dateparts[2]}-#{dateparts[0]}-#{dateparts[1]}"
    model = current_user.volunteer_activities.create(:organization => org, :activity => activity,
                                    :time => data[:hours], :date => fixed_date)

    render :json => model.to_json, :status => 201
  end

  def test
    logger.debug(params)
  end

  def index
    @quarters = []
    now = DateTime.now.beginning_of_quarter
    for i in 0..6
      @quarters << {:id => i, :name => "#{Date::MONTHNAMES[now.month]} #{now.year}", :beginning => now}
      now = now.last_quarter
    end

    if params[:quarter]
      quarter_idx = params[:quarter].to_i
      @displayed_quarter = @quarters[quarter_idx]
      @activities = current_user.organization.quarterly_report(@displayed_quarter[:beginning])
    else
      @activities = current_user.organization.quarterly_report
      @displayed_quarter = @quarters[0]
    end
  end

  private
    def volunteer_activity_params
      params.require(:volunteer_activity).permit(:hours, :date, :activity)
    end
end

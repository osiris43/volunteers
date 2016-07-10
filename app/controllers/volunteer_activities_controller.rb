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

  def index
  end

  private
    def volunteer_activity_params
      params.require(:volunteer_activity).permit(:hours, :date, :activity)
    end
end

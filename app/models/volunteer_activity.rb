class VolunteerActivity < ActiveRecord::Base
  belongs_to :user
  belongs_to :organization
  belongs_to :activity

  def as_json(options={})
    {
      :activity_name => self.activity.name,
      :activity_id => self.activity.id,
      :date => self.date,
      :time => self.time
    }
  end

  def self.current_month_hours(org)
    d = DateTime.now
    VolunteerActivity.where(:organization => org, :date => d.beginning_of_month..d.end_of_month).sum("time").to_f
  end

  def self.last_month_hours(org)
    d = DateTime.now.last_month
    VolunteerActivity.where(:organization => org, :date => d.beginning_of_month..d.end_of_month).sum("time").to_f
  end
  
  def self.current_quarter_hours(org)
    d = DateTime.now
    VolunteerActivity.where(:organization => org, :date => d.beginning_of_quarter..d.end_of_quarter).sum("time").to_f
  end

  def self.last_quarter_hours(org)
    d = DateTime.now.last_quarter
    VolunteerActivity.where(:organization => org, :date => d.beginning_of_quarter..d.end_of_quarter).sum("time").to_f
  end
end

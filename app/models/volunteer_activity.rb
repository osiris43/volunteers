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
end

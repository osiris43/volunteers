class VolunteerActivity < ActiveRecord::Base
  belongs_to :user
  belongs_to :organization
  belongs_to :activity
end

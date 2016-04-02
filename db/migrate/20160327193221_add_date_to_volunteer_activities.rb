class AddDateToVolunteerActivities < ActiveRecord::Migration
  def change
    change_table :volunteer_activities do |t|
      t.date :date
    end
  end
end

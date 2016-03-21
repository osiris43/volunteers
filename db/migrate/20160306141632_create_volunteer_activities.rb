class CreateVolunteerActivities < ActiveRecord::Migration
  def change
    create_table :volunteer_activities do |t|
      t.references :user, index: true, foreign_key: true
      t.references :organization, index: true, foreign_key: true
      t.references :activity, index: true, foreign_key: true
      t.decimal :time

      t.timestamps null: false
    end
  end
end

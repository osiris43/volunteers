class FixUsersForeignKey < ActiveRecord::Migration
  def change
    remove_foreign_key :volunteer_activities, :users
    add_foreign_key :volunteer_activities, :users, on_delete: :cascade
  end
end

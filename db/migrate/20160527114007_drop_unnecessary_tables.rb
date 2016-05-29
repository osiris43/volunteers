class DropUnnecessaryTables < ActiveRecord::Migration
  def up
    drop_table :organization_roles
    drop_table :roles
  end
end

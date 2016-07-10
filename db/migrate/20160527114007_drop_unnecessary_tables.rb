class DropUnnecessaryTables < ActiveRecord::Migration
  def up
    drop_table :organization_roles if table_exists?(:organization_roles)
    drop_table :roles if table_exists?(:roles)
  end
end

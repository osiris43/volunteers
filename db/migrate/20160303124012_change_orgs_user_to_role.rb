class ChangeOrgsUserToRole < ActiveRecord::Migration
  def change
    drop_table :organizations_users
  end
end

class OrganizationRole < ActiveRecord::Base
  belongs_to :organization
  belongs_to :user
  belongs_to :role

  def role_name
    return role.name
  end
end

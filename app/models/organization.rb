class Organization < ActiveRecord::Base
  has_many :organization_roles, class_name: "OrganizationRole"
  has_many :users, through: :organization_roles
  has_many :roles, through: :organization_roles
end

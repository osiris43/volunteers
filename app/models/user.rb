class User < ActiveRecord::Base
  has_many :organization_roles, class_name: "OrganizationRole"
  has_many :organizations, through: :organization_roles
  has_many :roles, through: :organization_roles
	has_many :volunteer_activities

	# Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def add_role(role, organization)
    role = Role.find_by(name: role) unless role.is_a?(Role)
    OrganizationRole.create(user: self, organization: organization, role: role)
  end 

	def admin?
		# This is a future bug if more organizations are added
		return roles.select{|r| r.name == "admin"}.count > 0
	end
end

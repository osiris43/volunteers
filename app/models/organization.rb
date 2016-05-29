class Organization < ActiveRecord::Base
  has_many :users

  def regular_users
    users.select{|u| !u.admin?}
  end
end

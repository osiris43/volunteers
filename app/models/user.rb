class User < ActiveRecord::Base
  has_many :volunteer_activities
  belongs_to :organization

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def current_quarters_hours
    volunteer_activities.where("date > ?", DateTime.now.beginning_of_quarter).inject(0){|sum, v| sum+v.time}.to_f
  end
end

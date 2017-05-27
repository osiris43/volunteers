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
  
  def current_quarters_activities
    volunteer_activities.where("date > ?", DateTime.now.beginning_of_quarter).all
  end

  def current_month_hours
    volunteer_activities.where("date > ?", DateTime.now.beginning_of_month).inject(0){|sum, v| sum+v.time}.to_f
  end
  def current_year_hours
    volunteer_activities.where("date > ?", DateTime.now.beginning_of_year).inject(0){|sum, v| sum+v.time}.to_f
  end


  def hours_history_by_month(num_months)
    start = DateTime.now - num_months.months
    activities = volunteer_activities.where("date > ?", start.beginning_of_month).all
    grouped = activities.group_by{|a| a.date.strftime("%b%y")}
    ticks, series = [], []
    
    num_months.times do |x|
      target = start.advance(months: x)
      key = target.strftime("%b%y")
      hours = grouped[key].nil? ? 0 : grouped[key].inject(0){|sum, m| sum + m.time}
      hours = hours.to_f
      ticks.append([x+1, key])
      series.append([x+1, hours])
    end

    result = {}
    result["ticks"] = ticks
    result["series"] = [series]

    result
    
  end
end

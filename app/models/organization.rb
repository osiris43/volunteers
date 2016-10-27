class Organization < ActiveRecord::Base
  has_many :users
  has_many :volunteer_activities

  def regular_users
    users.select{|u| !u.admin?}
  end

  def change_by_time_series(series)
    case series
    when "month"
      last_hours = hours_by_month(Date.today.last_month)
      current = hours_by_month(Date.today)
      monthChange = last_hours == 0 ? 0 : (current - last_hours) / last_hours * 100
      return (monthChange*20).round / 20.0
    when "quarter"
      last_hours = hours_by_quarter(Date.today.last_quarter)
      current = hours_by_quarter(Date.today)
      change = last_hours == 0 ? 0 : (current - last_hours) / last_hours * 100 
      return (change*20).round / 20.0
    when "year"
      last_hours = hours_by_year(Date.today.last_year)
      current = hours_by_year(Date.today)
      change = last_hours == 0 ? 0 : (current - last_hours) / last_hours * 100 
      return (change*20).round / 20.0
    else
      return 0.0
    end
  end

  def hours_by_month(basis_date)
    volunteer_activities.where(:date => basis_date.beginning_of_month..basis_date.end_of_month).sum("time").to_f
  end
  
  def hours_by_quarter(basis_date)
    volunteer_activities.where(:date => basis_date.beginning_of_quarter..basis_date.end_of_quarter).sum("time").to_f
  end
  
  def hours_by_year(basis_date)
    volunteer_activities.where(:date => basis_date.beginning_of_year..basis_date.end_of_year).sum("time").to_f
  end

  def quarterly_report(basis_date=Date.today)
    volunteer_activities.joins(:activity).where(:date => basis_date.beginning_of_quarter..basis_date.end_of_quarter).select("activity_id, activities.name, sum(time) as total_hours").group("activity_id, activities.name")
  end
  
  def monthly_report(basis_date=Date.today)
    this_month = volunteer_activities.joins(:activity).where(:date => basis_date.beginning_of_month..basis_date.end_of_month).select("activity_id, activities.name, sum(time) as total_hours").group("activity_id, activities.name")
    last_month = volunteer_activities.joins(:activity).where(:date => basis_date.last_month.beginning_of_month..basis_date.last_month.end_of_month).select("activity_id, activities.name, sum(time) as total_hours").group("activity_id, activities.name")
    activities = Activity.all
    report = {}
    activities.each do |act|
      current = this_month.inject(0){|sum, a| a.activity_id == act.id ? sum + a.total_hours : 0}
      last = last_month.inject(0){|sum, a| a.activity_id == act.id ? sum + a.total_hours : 0}
      report[act.name] = [current, last]
    end

    report
  end
end

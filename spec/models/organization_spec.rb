require 'rails_helper'

RSpec.describe Organization, type: :model do
  context "when organization has hours" do
    let(:organization) {FactoryGirl.create :organization}
    let(:activity) {Activity.first}
    it "provides hours report for this month" do
      organization.users << (FactoryGirl.create :user)
      organization.users.first.volunteer_activities.create(:organization => organization, :activity => activity,
                                    :time => 3, :date => Date.today)
      expect(organization.hours_by_month(Date.today)).to eq(3)
    end
    
    it "provides hours report for last month" do
      organization.users << (FactoryGirl.create :user)
      organization.users.first.volunteer_activities.create(:organization => organization, :activity => activity,
                                    :time => 3, :date => Date.today.last_month)
      expect(organization.hours_by_month(Date.today.last_month)).to eq(3)
    end
    
    it "provides hours report for this quarter" do
      organization.users << (FactoryGirl.create :user)
      organization.users.first.volunteer_activities.create(:organization => organization, :activity => activity,
                                    :time => 3, :date => Date.today)
      organization.users.first.volunteer_activities.create(:organization => organization, :activity => activity,
                                    :time => 3, :date => Date.today.beginning_of_quarter)
      expect(organization.hours_by_quarter(Date.today)).to eq(6)
    end
    
    it "provides hours report for last quarter" do
      organization.users << (FactoryGirl.create :user)
      d = Date.today.last_quarter
      organization.users.first.volunteer_activities.create(:organization => organization, :activity => activity,
                                    :time => 3, :date => d)
      organization.users.first.volunteer_activities.create(:organization => organization, :activity => activity,
                                    :time => 3, :date => d.beginning_of_quarter)
      expect(organization.hours_by_quarter(d)).to eq(6)
    end

    it "provides hours report for this year" do
      organization.users << (FactoryGirl.create :user)
      organization.users.first.volunteer_activities.create(:organization => organization, :activity => activity,
                                    :time => 3, :date => Date.today)
      organization.users.first.volunteer_activities.create(:organization => organization, :activity => activity,
                                    :time => 3, :date => Date.today.beginning_of_year)
      expect(organization.hours_by_year(Date.today)).to eq(6)
    end

    it "provides hours report for last quarter" do
      organization.users << (FactoryGirl.create :user)
      d = Date.today.last_year
      organization.users.first.volunteer_activities.create(:organization => organization, :activity => activity,
                                    :time => 3, :date => d)
      organization.users.first.volunteer_activities.create(:organization => organization, :activity => activity,
                                    :time => 3, :date => d.beginning_of_year)
      expect(organization.hours_by_year(d)).to eq(6)
    end

    it "calculates change over time" do
      organization.users << (FactoryGirl.create :user)
      organization.users.first.volunteer_activities.create(:organization => organization, :activity => activity,
                                    :time => 4.5, :date => Date.today)
      organization.users.first.volunteer_activities.create(:organization => organization, :activity => activity,
                                    :time => 3, :date => Date.today.last_month)
      expect(organization.change_by_time_series("month")).to eq(50.00)
    end
  end
end

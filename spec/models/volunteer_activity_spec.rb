require 'rails_helper'

RSpec.describe VolunteerActivity, type: :model do
  context "when calculating hours" do
    let(:activity) {FactoryGirl.create :volunteer_activity}
    it "adds this month's hours correctly" do
      expect(VolunteerActivity.current_month_hours(activity.organization)).to eq(4)
    end
  end
end

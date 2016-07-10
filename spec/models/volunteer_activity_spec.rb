require 'rails_helper'

RSpec.describe VolunteerActivity, type: :model do
  context "when calculating hours" do
    let(:activity) {FactoryGirl.create :volunteer_activity}
    it "correct json" do
      expect(activity.as_json).to_not be_nil
    end
  end
end

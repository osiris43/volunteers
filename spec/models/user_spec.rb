require 'rails_helper'

RSpec.describe User, type: :model do
  context "when user is created" do
    let(:user) {FactoryGirl.create :user}
    it "returns name" do
      expect(user.name).to eq("Brett Bim")
    end
  end
  context "when user is admin" do
    let(:user) {FactoryGirl.create :admin}
    it "reports as admin" do
      expect(user.admin?).to be(true)
    end
  end
end

require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

  describe "GET #index" do
    let(:user) {FactoryGirl.create(:user)}
    it "returns http success" do
      controller.stub(current_user: user)
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end

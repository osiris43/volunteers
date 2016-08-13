require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #show" do
    # Wasting time trying to get this to run, revisit in the future with more time
    # https://github.com/plataformatec/devise/wiki/How-To:-Stub-authentication-in-controller-specs
    let(:user) {FactoryGirl.create(:user)}
    it "returns http success" do
      sign_in user
      get :show, :id => user.id
      expect(response).to have_http_status(:success)
    end
  end

end

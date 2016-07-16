class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = current_user.organization.regular_users
    @users.to_json
  end
end

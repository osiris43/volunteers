class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @history = @user.hours_history_by_month(13)
  end

  def index
    @users = current_user.organization.regular_users
    @users.to_json
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to dashboard_index_path
  end
end

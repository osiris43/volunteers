class OrganizationsController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def create
    @organization = Organization.create(org_params)
    if @organization.save
      current_user.admin = true
      current_user.save
      redirect_to users_show_path(current_user)
    else
      render 'new'
    end

  end

  def update
  end

 
  private
  def org_params
    params.require(:organization).permit(:name, :description)
  end
end

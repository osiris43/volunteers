class OrganizationsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @organization = Organization.create(org_params)
    if @organization.save
      current_user.add_role('admin', @organization)
      redirect_to users_show_path(current_user)
    else
      render 'new'
    end

  end

  def update
  end

  def show
  end
 
  private
  def org_params
    params.require(:organization).permit(:name, :description)
  end
end

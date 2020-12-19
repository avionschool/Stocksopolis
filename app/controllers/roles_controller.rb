class RolesController < ApplicationController
  def index
    @roles = Role.all
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
 

    if @role.save
     redirect_to roless_path
     else
     render :new
   end
end

  def show
      @role = Role.find(params[:id])
  end

  private

  def role_params
    params.require(:role).permit(:role_name)
  end
end

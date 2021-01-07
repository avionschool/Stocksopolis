class UsersController < ApplicationController
  before_action :authenticate_user!, :check_admin
  def index
    if !@is_admin
      return
    end
    @users = User.all
      
  end

  def toggle_status
    if !@is_admin
      return
    end
    user_to_toggle = User.find(params[:id])
    if user_to_toggle.status == "pending"
      user_to_toggle.status = "approved"
    else
      user_to_toggle.status = "pending"
    end
    user_to_toggle.save
    UserMailer.with(user: user_to_toggle).status_changed_email.deliver_now
    redirect_to root_url
    
  end

  private
  def check_admin
    if current_user.role.role_name == "admin"
      @is_admin = true
    else
      @is_admin = false
    end
  end
end

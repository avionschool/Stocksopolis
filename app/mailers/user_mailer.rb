class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: "Welcome")
  end
  def status_changed_email
    @user = params[:user]
    mail(to: @user.email, subject: "Account #{@user.status}")
  end
end

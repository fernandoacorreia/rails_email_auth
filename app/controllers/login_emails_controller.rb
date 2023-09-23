class LoginEmailsController < ApplicationController
  allow_logged_out_users

  def new
    @redirect_path = params[:redirect_path]
  end

  def create
    # Send an email with a link
    EmailAuth::EmailsLink.new.email(
      email: params[:email],
      redirect_path: params[:redirect_path]
    )
    # Redirect with notice
    flash[:notice] = "E-mail sent to #{params[:email]}."
    redirect_to login_email_path
  end
end

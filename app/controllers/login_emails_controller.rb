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

  def authenticate
    result = EmailAuth::ValidatesLoginAttempt.new.validate(params[:token])
    if result.success?
      reset_session
      session[:user_id] = result.user.id
      flash[:notice] = "Welcome, #{result.user.email}!"
      redirect_to params[:redirect_path]
    else
      flash[:error] = "We weren't able to log you in with that link. Try again?"
      redirect_to new_login_email_path(redirect_path: params[:redirect_path])
    end
  end

  def destroy
    reset_session
    flash[:notice] = "Your account has been successfully logged out."
    redirect_to new_login_email_path
  end
end

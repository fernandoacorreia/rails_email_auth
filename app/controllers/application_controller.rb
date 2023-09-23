class ApplicationController < ActionController::Base
  before_action :require_login

  def require_login
    # Set current used from cookie-based session, if there is one
    @current_user = User.find_by(id: session[:user_id])
    # Redirect to login if no user was found
    if !@current_user.present?
      redirect_to new_login_email_path(redirect_path: request.original_fullpath)
    end
  end

  def self.logged_out_users_welcome!
    skip_before_action :require_login
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	helper_method :current_user #provide access to :current_user function for views
  helper_method :signed_in?

	protected
	#this function getting data from session object to pass to view layer
	def current_user
		return @current_user if @current_user
		if session[:user_id]
			@current_user = User.find session[:user_id]
		end
	end

  def signed_in?
    session[:user_id] ? true : false
  end

  def require_login
    if !signed_in?
      flash[:info] = "You must logged in before see this page"
      redirect_to root_path
    end
  end

  def skip_if_logged_in
    if signed_in?
      redirect_to users_path
    end
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  alias_method :current_user, :current_admin

  # rescue_from Pundit::NotAuthorizedError do |exception|
  # 	redirect_to root_url, alert: exception.message
  # end

  def user_not_authorized
  	flash[:error] = "I'm sorry you're are not authorized to perform this action."
  	redirect_to(request.referrer || root_path)
  end
end

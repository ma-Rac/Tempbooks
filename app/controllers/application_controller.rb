class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    redirect_to friends, method: => :create
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end

class ApplicationController < ActionController::Base
  include SentientController
  protect_from_forgery with: :exception
  before_filter :authorize

  def current_user
    @current_user ||= session[:user_id] && User.find_by_id(session[:user_id])
  end

  helper_method :current_user

  protected
    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to root_path, alert: t(:please_log_in)
      end
    end
end

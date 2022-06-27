class ApplicationController < ActionController::Base
  def current_user
    if session[:user_id]
      User.find session[:user_id]
    else
      Guest.new
    end
  end

  helper_method :current_user
end

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to posts_url, notice: "Logged in successfully as #{user.email}"
    else
      render :new
    end
  end

  def destroy
    if current_user.id == session[:user_id]
      session[:user_id] = nil
      redirect_to root_path, notice: "Logged out successfully."
    else
      redirect_to root_path, notice: "Not Authorized!"
    end
  end
end

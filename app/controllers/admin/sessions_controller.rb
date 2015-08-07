class Admin::SessionsController < Admin::ApplicationController
  layout "admin/login"

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome, #{user.name} you're now logged in"
      redirect_to admin_posts_path
    else
      flash[:danger] = "Invalid username or password"
      redirect_to admin_login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You're now logged out"
    redirect_to admin_login_path
  end
end

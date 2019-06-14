class SessionsController < ApplicationController

  def welcome
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end

  def new
  end

  def create
    #Try to find the user in the system
    @user = User.find_by(username: params[:user][:username])
    #did we find someone & did they put in the right password?
    #if @user && @user.authenticate(params[:user][:password])

    if @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "Sorry, login info was incorrect. Please try again."
      redirect_to login_path
    end
  end

  def omniauth
    if params[:provider] == 'google_oauth2'
      @user = User.from_google_omniauth(auth)
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    elsif params[:provider] == 'github'
      @user = User.from_github_omniauth(auth)
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to login_path
    end
  end

  private
    def auth
      request.env['omniauth.auth']
    end
end


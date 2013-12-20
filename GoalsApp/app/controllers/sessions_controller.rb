class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(*params[:user].values)
    if @user
      login!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:messages] = ["Invalid username or password"]
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

end

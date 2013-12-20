class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
  end

  def new
    # @user = User.new
    render :new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @goals = @user.goals
    @private_goals = @goals.select { |goal| goal.private }
    @public_goals = @goals.select { |goal| !goal.private }
    render :show
  end

  def edit
  end

  def update
  end
end

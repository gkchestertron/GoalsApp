class GoalsController < ApplicationController
  def create
    @goal = Goal.new(params[:goal])
    @goal.user = current_user
    flash[:errors] = @goal.errors.full_messages unless @goal.save
    redirect_to user_url(@goal.user)
  end

  def new
  end

  def destroy
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update_attributes(params[:goal])
      redirect_to goal_url(@goal)
    else
      flash[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def index
  end
end

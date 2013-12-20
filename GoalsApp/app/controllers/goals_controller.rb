class GoalsController < ApplicationController
  def create
    @goal = Goal.new(params[:goal])
    @goal.user = current_user
    unless @goal.save
      flash[:errors] = @goal.errors.full_messages
    end
    redirect_to user_url(current_user)
  end

  def new
  end

  def destroy
  end

  def show
  end

  def update
  end

  def edit
  end

  def index
  end
end

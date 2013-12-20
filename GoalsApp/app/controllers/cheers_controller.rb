class CheersController < ApplicationController
  def create
    @cheer = Cheer.new
    @cheer.user_id = current_user.id
    @cheer.goal_id = params[:goal_id]
    flash[:errors] = @cheer.errors.full_messages unless @cheer.save
    redirect_to goal_url(@cheer.goal)
  end

  def destroy
  end
end

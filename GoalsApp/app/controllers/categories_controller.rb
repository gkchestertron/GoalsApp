class CategoriesController < ApplicationController
  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to categories_url
    else
      flash[:errors] = @category.errors.full_messages
      render :new
    end
  end

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    @sorted_goals = @category.goals.sort { |goal| goal.cheers.count }.reverse
  end

end

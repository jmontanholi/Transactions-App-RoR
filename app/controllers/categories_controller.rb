class CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = current_user.categories
  end

  def show
    @category = Category.find(params[:id])
    @expenses = @category.expenses.order(:created_at)
  end

  def new
    @errors = params[:errors]
  end

  def create
    @category = current_user.categories.new(category_params)
    if @category.save
      flash[:notice] = 'Category created successfully'
      redirect_to '/user'
    else
      flash[:notice] = 'Something is wrong, please look at the errors'
      @errors = @category.errors.full_messages
      redirect_to categories_new_path(errors: @errors)
    end
  end

  private

  def category_params
    params.permit(:name, :icon)
  end
end

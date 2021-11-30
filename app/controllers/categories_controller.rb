class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories.includes(:expenses)
  end

  def show
    @category = Category.find(params[:id])
    @expenses = @category.expenses.order(:created_at)
  end

  def new
    @errors = params[:errors]
  end

  def create
    @user = current_user
    @category = current_user.categories.new(name: params[:name], icon: params[:icon])
    if @category.save
      flash[:notice] = 'Category created successfully'
      redirect_to '/user'
    else
      flash[:notice] = 'Something is wrong, please look at the errors'
      @errors = @category.errors.full_messages
      redirect_to categories_new_path(errors: @errors)
    end
  end
end

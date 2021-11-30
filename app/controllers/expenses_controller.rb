class ExpensesController < ApplicationController
  def new
    @errors = params[:errors]
    @category = Category.find(params[:category_id])
  end

  def create
    @user = current_user
    @expense = current_user.expenses.new(name: params[:name], amount: params[:amount])
    if @expense.save
      params[:categories].each do |category_id|
        category = Category.find(category_id)
        @expense.categories << category
      end
      flash[:notice] = 'Expense created successfully'
      redirect_to "/categories/#{params[:category_id]}"
    else
      flash[:notice] = 'Something is wrong, please look at the errors'
      @errors = @category.errors.full_messages
      redirect_to expenses_new_path(errors: @errors)
    end
  end
end

class ExpensesController < ApplicationController
  load_and_authorize_resource

  def new
    @errors = params[:errors] if params[:errors]
    @category = Category.find(params[:category_id])
  end

  def create
    @expense = current_user.expenses.new(expense_parameters)
    if @expense.save
      params[:categories].each do |category_id|
        category = Category.find(category_id)
        @expense.categories << category
      end
      flash[:notice] = 'Expense created successfully'
      redirect_to "/categories/#{params[:category_id]}"
    else
      flash[:notice] = 'Something is wrong, please look at the errors'
      @errors = @expense.errors.full_messages
      redirect_to expenses_new_path(errors: @errors, category_id: params[:category_id])
    end
  end

  private

  def expense_parameters
    params.permit(:name, :amount)
  end
end

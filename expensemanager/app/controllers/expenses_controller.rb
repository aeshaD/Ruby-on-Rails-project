class ExpensesController < ApplicationController
	before_action :set_expense, only: [:show, :edit, :update, :destroy]
	
  def index
  require 'csv'
  @expenses = Expense.all
  respond_to do |format|
			  format.html
			  format.pdf do
				render :pdf => "report",
				:template => 'expenses/expenses-index.pdf.erb'        
			end
		format.csv do
         results = CSV.generate do |csv|
            csv << ["Category Name","Amount($)"]
            @expenses.each{|expense|
              csv << [expense.category.try(:cname),expense.amount]
            }            
        end
        send_data(results, :filename => "expenses_bank_statement.csv")
		end
	 end
  end

  def show
	@expenses = Expense.all
  end

  def new
  @expense = Expense.new
  end
  
  def create
   @expense = Expense.new(expense_params)
	  
	  respond_to do |format|
		if @expense.save
			format.html {redirect_to @expense, notice: 'Expense was successfully added!'}
			format.json {render :show, status:created, location: @expense}
		else
			format.html {render :new}
			format.json {render json: @expense.errors, status: :unprocessable_entity}
		end
	 end
  end

  def edit
	
  end
  
  def update
	@expense = Expense.find(params[:id])
		 
		  if @expense.update(expense_params)
			redirect_to @expense
		  else
			render 'edit'
		  end
	end
		
  def destroy
	@expense = Expense.find(params[:id])
		@expense.destroy
		respond_to do |format|
			format.html {redirect_to @expense, notice:'Income was destroyed successfully'}
			
		end
	end
  
  private
  def set_expense
	@expense = Expense.find_by(:id => params[:id], :user_id => session[:user_id])
	raise ActiveRecord::RecordNotFound if @expense.blank?
	end
	
  def expense_params
		  params[:expense][:user_id] = session[:user_id]
		  params.require(:expense).permit(:amount,:user_id, :category_attributes => [:cname])
  end
end

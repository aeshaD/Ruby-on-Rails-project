class IncomesController < ApplicationController
	before_action :set_income, only: [:show, :edit, :update, :destroy]
	
	def index
		require 'csv'
		@incomes = Income.all
		 respond_to do |format|
			  format.html
			  format.pdf do
				render :pdf => "report",
				:template => 'incomes/incomes-index.pdf.erb'        
			end
		format.csv do
         results = CSV.generate do |csv|
            csv << ["Category Name","Amount($)"]
            @incomes.each{|income|
              csv << [income.icategory.try(:icname),income.amount]
            }            
        end
        send_data(results, :filename => "income_bank_statement.csv")
		end
	 end

	end
	
	def show
		@incomes = Income.all
	end

	def new
	  @income = Income.new
	end

	def edit
	end

	def create
	  @income=Income.new(income_params)
	  
	  respond_to do |format|
		if @income.save
			format.html {redirect_to @income, notice: 'Income was successfully added!'}
			format.json {render :show, status:created, location: @income}
		else
			format.html {render :new}
			format.json {render json: @income.errors, status: :unprocessable_entity}
		end
	 end
	end

	def update
	@income = Income.find(params[:id])
		 
		  if @income.update(income_params)
			redirect_to @income
		  else
			render 'edit'
		  end
		end
	 

	def destroy
	@income = Income.find(params[:id])
		@income.destroy
		respond_to do |format|
			format.html {redirect_to @income, notice:'Income was destroyed successfully'}
			
		end
	end
	
  private	
	def set_income
	@income = Income.find_by(:id => params[:id], :user_id => session[:user_id])
	raise ActiveRecord::RecordNotFound if @income.blank?
	end
	
	def income_params
		  params[:income][:user_id] = session[:user_id]
		  params.require(:income).permit(:amount,:user_id, :icategory_attributes => [:icname])
	end

end

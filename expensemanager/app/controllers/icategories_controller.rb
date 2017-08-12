class IcategoriesController < ApplicationController
  def index
	@icategories = Icategory.all
  end

  def show
    @icategories = Icategory.all
  end
  
  def edit
	@icategory = Icategory.find(params[:id])
  end
  
  def new
	@icategory = Icategory.new
  end
  
  def create
	@icategory = Icategory.new(icategory_params)
	
	respond_to do |format|
		if @icategory.save
			format.html {redirect_to @icategory, notice:'Income category was successfully created'}
			format.json {render :show, status:created, location: @icategory}
		else
			format.html {render :new}
			format.json {render json: @icategory.errors, status: :unprocessable_entity}
		end
	end
  end
  
  def update
		  @icategory = Icategory.find(params[:id])
		 
		  if @icategory.update(icategory_params)
			redirect_to @icategory
		  else
			render 'edit'
		  end
		end
  
  def destroy
		@icategory = Icategory.find(params[:id])
		@icategory.destroy
		respond_to do |format|
			format.html {redirect_to @icategory, notice:'Income Category was destroyed successfully'}
			format.json {render :show}
		end
	end
  private
		def icategory_params
		  params.require(:icategory).permit(:icname)
		end
		
	
end

class CategoriesController < ApplicationController
  def index
	@categories = Category.all
  end

  def show
    @categories = Category.all
  end
  
  def edit
	@category = Category.find(params[:id])
  end
  
  def new
	@category = Category.new
  end
  
  def create
	@category = Category.new(category_params)
	
	respond_to do |format|
		if @category.save
			format.html {redirect_to @category, notice:'category was successfully created'}
			format.json {render :show, status:created, location: @category}
		else
			format.html {render :new}
			format.json {render json: @category.errors, status: :unprocessable_entity}
		end
	end
  end
  
  def update
		  @category = Category.find(params[:id])
		 
		  if @category.update(category_params)
			redirect_to @category
		  else
			render 'edit'
		  end
		end
  
  def destroy
		@category = Category.find(params[:id])
		@category.destroy
		respond_to do |format|
			format.html {redirect_to @category, notice:'Category was destroyed successfully'}
			format.json {render :show}
		end
	end
  private
		def category_params
		  params.require(:category).permit(:cname)
		end
		
	
end

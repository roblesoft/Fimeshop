class ProductsController < ApplicationController

	before_action :set_product, only: [:show, :edit, :update, :destroy]

	def new
		@product = Product.new
	end

	def create
       @product = current_user.products.new product_params

          if @product.save
			return redirect_to @product
          end

		  render :new
	end

	def show
	end

	def edit
	end

	def update
		@product.update product_params
		redirect_to @product
	end

	def destroy
		@product.destroy
		redirect_to products_path
	end

	def index
		@products = Product.all
	end

	private 
	def product_params
		params.require(:product).permit(:name, :description, :price, :available, :category)
	end

	def set_product
		@product = Product.find params[:id]
	end
end

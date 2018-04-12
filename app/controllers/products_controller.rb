class ProductsController < ApplicationController

	before_action :set_product, only: [:show]

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
	private 
	def product_params
		params.require(:product).permit(:name, :description, :price, :available, :desktop, :clothing, :accessories, :thermos, :others )
	end

	def set_product
		@product = Product.find params[:id]
	end
end

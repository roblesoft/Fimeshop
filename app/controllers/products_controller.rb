class ProductsController < ApplicationController

	before_action :set_product, only: [:show, :edit, :update, :destroy]
	before_action :admin, only: [:edit]


	def new
		if user_signed_in?
			if current_user.roll	
				@product = Product.new
			else 
				redirect_to root_path
			end
			else
				redirect_to root_path
		end
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
		if current_user.roll
			@product.update product_params
			redirect_to @product
		else
			redirect_to root_path
		end
	end

	def destroy
		if current_user.roll
			@product.destroy
			redirect_to root_path
		else
			redirect_to root_path
		end
	end

	def index
		if user_signed_in?
			if current_user.roll
				@products = Product.all
			else
				redirect_to root_path
			end
		else redirect_to root_path
		end
	end

	private 
	def product_params
		params.require(:product).permit(:name, :description, :price, :available, :category, :picture)
	end

	def set_product
		@product = Product.find params[:id]
	end

	def admin
		if user_signed_in?
			if current_user.roll
				self.edit
			else
				redirect_to root_path
			end
		else redirect_to root_path
		end
	end
end

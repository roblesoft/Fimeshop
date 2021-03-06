class ProductsController < ApplicationController

	before_action :set_product, only: [:show, :edit, :update, :destroy]
	before_action :admin, only: [:edit]


	def new
		if user_signed_in?
			if current_user.roll	
				respond_to do |format|
					format.html
					format.js
				end
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
			return redirect_to ""
          end
			redirect_to products_path
	end

	def show
		@comment = Comment.new
		@reservation = Reservation.new
	end

	def edit
	end

	def update
		if current_user.roll
			@product.update product_params
			redirect_to products_path
		else
			redirect_to root_path
		end
	end

	def destroy
		if current_user.roll
			@product.comments.each do|comment| 
				comment.destroy
			end
			@product.destroy
			redirect_to ""
		else
			redirect_to root_path
		end
	end

	def index
		if user_signed_in?
			if current_user.roll
				@products = Product.all
				@reservations = Reservation.all
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

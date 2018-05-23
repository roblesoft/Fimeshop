class HomeController < ApplicationController
	before_action :select_products, only: [:desktop, :vestimenta, :accesorios, :termos, :otros]
	before_action :set_reservation

	def index
		@products = Product.order(id: :desc)
	end

	def nuevo
		@products = Product.order(id: :desc)
	end

	def desktop
	end

	def vestimenta
	end

	def accesorios
	end

	def termos
	end

	def otros
	end

	def reservaciones
		if user_signed_in?
			if current_user.roll
				@reservations = Reservation.all
			else
				redirect_to root_path
			end
		else redirect_to root_path
		end
	end


	private 
	def select_products
		@products = Product.all
	end
	def set_reservation
		@reservation = Reservation.new
	end
end

class HomeController < ApplicationController
	before_action :select_products, only: [:desktop, :vestimenta, :accesorios, :termos, :otros]

	def index
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

	private 
	def select_products
		@products = Product.all
	end
end

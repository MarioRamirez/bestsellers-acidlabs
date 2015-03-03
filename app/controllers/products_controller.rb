class ProductsController < ApplicationController

	def index
		@product = Product.random
		render json: @product
	end

end

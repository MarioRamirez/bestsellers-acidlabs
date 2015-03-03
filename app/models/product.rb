class Product < ActiveRecord::Base

	# Selecciona un producto al azar de los últimos 4 agregados.
	scope :random, proc { last(4).sample(1) }

end

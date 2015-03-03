Rails.application.routes.draw do

  root to: redirect('/random-bestseller')

	get '/random-bestseller', to: 'products#index', as: :random_bestseller
end

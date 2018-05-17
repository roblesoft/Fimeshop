Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :products do
	resources :comments , only: [:create, :destroy, :update ]
  end
  get 'desktop', to: 'home#desktop'
  get 'vestimenta', to: 'home#vestimenta'
  get 'accesorios', to: 'home#accesorios'
  get 'termos', to: 'home#termos'
  get 'otros', to: 'home#otros'
  get 'nuevo', to: 'home#nuevo'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

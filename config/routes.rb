Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :products
  get 'desktop' , to: 'home#desktop'
  get 'vestimenta', to: 'home#vestimenta'
  get 'accesorios', to: 'home#accesorios'
  get 'termos', to: 'home#termos'
  get 'otros', to: 'home#otros'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

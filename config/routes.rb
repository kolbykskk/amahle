Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :products
    root 'products#index'

  get 'images', to: 'images#index'

  post 'images/saveImage', to: 'images#saveImage'
  post 'images/uploadPhoto', to: 'images#uploadPhoto'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

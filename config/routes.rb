Rails.application.routes.draw do
  devise_for :users
  resources :songs
  root 'songs#index'

end

Rails.application.routes.draw do
  resources :reviews
  resources :movies
  root to: redirect('/movies')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

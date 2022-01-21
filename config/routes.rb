Rails.application.routes.draw do
  get 'pets/random' => 'pets#random'
  resources :pets
end

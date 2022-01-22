Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'pets/random' => 'pets#random'
      resources :pets
    end
  end
end
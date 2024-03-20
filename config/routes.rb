Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  

  get 'horses/:horse_id/likes' => 'likes#create'
  get 'horses/:horse_id/likes/:id' => 'likes#destroy'
  resources :horses
  root 'horses#index'
  resources :horses do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
 
  
  resources :restaurants, only: [:index, :show] 
  namespace :admin do
    resources :restaurants, only: [:index, :new, :create, :show,  :edit, :destroy]
  end

end

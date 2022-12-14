Rails.application.routes.draw do
  
  devise_for :users
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  
  root to: 'homes#top'
  get '/about' => 'homes#about'
  resources :users
  resources :maps
  resources :spots
  resources :posts
  get '/plans/route' => 'plans#route'
  get '/plans/info' => 'plans#info'
  get '/plans/confirm' => 'plans#confirm'
  get '/plans/complete' => 'plans#complete'
  resources :plans do
    get 'join' => 'plans#join'
    get 'out' => 'plans#out'
    resource :group_chats
  end
  resources :places
  
end

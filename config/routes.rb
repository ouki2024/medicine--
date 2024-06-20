Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to:'homes#top'
  get '/about' => 'homes#about' 
  
  get '/mypage' => 'users#show'
  resources :users, only: [:show, :edit, :update]
  
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to:'homes#top'
  get '/about' => 'homes#about' 
  
  get '/mypage' => 'users#show'
  resources :users, only: [:show, :edit, :update]
  

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

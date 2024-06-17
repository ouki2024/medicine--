Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to:'homes#top'
  get '/mypage' => 'users#show'
  
  get '/about' => 'homes#about'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

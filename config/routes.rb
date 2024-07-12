Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'users', to: 'users#index'
    resources :users, only: [:index, :destroy]
  end


  devise_for :users
  root to:'homes#top'
  # get '/about' => 'homes#about'

  get '/mypage' => 'users#show'
  resources :users, only: [:show, :edit, :update]

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  resources :reviews do
    resources :review_comments, only: [:create, :destroy]
    collection do
      get '/search', to: 'reviews#index'
    end

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

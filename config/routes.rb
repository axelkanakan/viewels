Viewels::Application.routes.draw do
  
  get "users/show"

  resources :viewels

  resources :users do
    member do
      get :follow
      get :unfollow
    end
  end

  devise_for :users 

  authenticated :user do
  	root to: 'viewels#index'
  end

  match "about" => 'welcome#about', via: :get
  
  root :to => 'welcome#index'
end

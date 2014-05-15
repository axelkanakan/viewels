Viewels::Application.routes.draw do
  
  get "users/show"

  resources :viewels

   devise_for :users 

  resources :users do
    member do
      get :follow
      get :unfollow
    end
  end

 

  authenticated :user do
  	root to: 'viewels#index'
  end

  match "about" => 'welcome#about', via: :get
  
  root :to => 'welcome#index'
end

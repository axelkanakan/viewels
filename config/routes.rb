Viewels::Application.routes.draw do
  
  resources :viewels

  devise_for :users 

  authenticated :user do
  	root to: 'viewels#index'
  end

  match "about" => 'welcome#about', via: :get
  
  root :to => 'welcome#index'
end

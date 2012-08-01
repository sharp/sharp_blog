SharpBlog::Application.routes.draw do
  resources :sessions
  match 'logout', :to => 'sessions#destroy', :as => :logout
  match 'tags/:tag', :to => 'posts#index', :as => :tag_posts
  resources :archives, :only => [:index]
  resources :comments
  resources :posts do 
    resources :comments
  end
  root :to => 'posts#index'
end

SharpBlog::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users" }
  devise_scope :user do
    get '/users/auth/:provider' => 'users#passthru'
    get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  match 'load_link', :to => 'bookmarks#load_link', :as => :load_link

  match 'tags/:tag', :to => 'posts#index', :as => :tag_posts
  resources :archives, :only => [:index]
  resources :bookmarks

  resources :comments
  resources :posts do 
    resources :comments
  end
  root :to => 'posts#index'
end

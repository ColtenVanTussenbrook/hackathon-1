Rails.application.routes.draw do
  # get 'homes/index'
  # get 'homes/show'
  # get 'homes/about'
  # devise_for :views
  # get 'comments/index'
  # get 'comments/show'
  # get 'comments/edit'
  # get 'posts/index'
  # get 'posts/show'
  # get 'posts/edit'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :posts
  end
  
  resources :posts do
    resources :comments
  end

  root 'posts#index'
end

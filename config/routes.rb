Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :articles do
  	resources :comments
  end

  resources :tags

  root to: 'articles#index'

  end

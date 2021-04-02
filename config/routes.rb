Rails.application.routes.draw do

  devise_for :admins

  namespace :admin do
  root 'hoems#top'
  resources :movies, only: [:index, :new, :create, :show, :edit, :update]
  resources :genres, only: [:index, :create, :edit, :update]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :movie_comments, only: [:show, :update, :index, :edit, :destroy, :create]
  resources :favorites, only: [:create, :destroy]
  end


  scope module: :public do
    root 'homes#top'
    resources :movies, only: [:index, :show]
    resources :movie_comments, only: [:show, :update, :index, :edit, :destroy, :create]
    resource :relationships, only: [:create, :destroy]
  	get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
    resources :customers, only: [:show, :edit, :update] do
      member do
        patch 'withdrawal'
        get 'unsubscribe'
      end
    end

  end

  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end

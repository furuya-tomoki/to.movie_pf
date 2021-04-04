Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/sessions',
    registrations: 'admins/registrations',
  }
# devise customersと被らないよう指定

  namespace :admin do
  root 'hoems#top'
  resources :movies, only: [:index, :new, :create, :show, :edit, :update]
  resources :genres, only: [:index, :create, :edit, :update, :destroy]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :movie_comments, only: [:show, :update, :index, :edit, :destroy, :create]
  resources :favorites, only: [:create, :destroy]
  end
devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/sessions',
    registrations: 'customers/registrations',
}

  scope module: :public do
    root 'homes#top'
    get 'homes/about' => 'homes#about'
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


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end

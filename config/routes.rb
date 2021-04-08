Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/sessions',
    registrations: 'admins/registrations',
  }
# devise customersと被らないよう指定

  namespace :admin do
  root 'homes#top'
  resources :movies, only: [:index, :new, :create, :show, :edit, :update]
  resources :genres, only: [:index, :create, :edit, :update, :destroy]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :movie_comments, only: [:show, :update, :index, :edit, :destroy, :create]
  resources :favorites, only: [:create, :destroy]
  end

  scope module: :public do
    root 'homes#top'
    get 'homes/about' => 'homes#about'
    resources :movies, only: [:index, :show, :create] do
    resources :movie_comments, only: [:destroy, :create]
    resource :favorites, only: [:create, :destroy]
  end


    resource :customers, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]

  	get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
      member do
        patch 'withdrawal'
        get 'unsubscribe'
      end
    end
  end
devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/sessions',
    registrations: 'customers/registrations',
}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end

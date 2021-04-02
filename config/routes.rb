Rails.application.routes.draw do
  namespace :admin do
    get 'favorites/create'
    get 'favorites/destroy'
  end
  namespace :admin do
    get 'movie_comments/show'
    get 'movie_comments/update'
    get 'movie_comments/index'
    get 'movie_comments/edit'
    get 'movie_comments/destory'
    get 'movie_comments/create'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
  end
  get 'admin/movies'
  get 'admin/index'
  get 'admin/new'
  get 'admin/create'
  get 'admin/show'
  get 'admin/edit'
  get 'admin/update'
  get 'relationships/create'
  get 'relationships/destroy'
  get 'relationships/followings'
  get 'relationships/followers'
  get 'favorites/create'
  get 'favorites/destroy'
  get 'movie_comments/show'
  get 'movie_comments/update'
  get 'movie_comments/index'
  get 'movie_comments/edit'
  get 'movie_comments/destroy'
  get 'movie_comments/create'
  get 'customers/show'
  get 'customers/edit'
  get 'customers/update'
  get 'customers/withdrawal'
  get 'movies/index'
  get 'movies/show'
  get 'homes/top'
  get 'homes/about'
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
end

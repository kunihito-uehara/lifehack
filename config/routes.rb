Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'comments#index'
  # root 'articles#top'
  resources :articles
  # resources :favorites
  resources :comments
  # resources :requests
  resources :users

  devise_for :users
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end

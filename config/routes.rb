Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'comments#index'
  # root 'articles#top'
  # resources :articles

  devise_for :users
  resources :comments
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end

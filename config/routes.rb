Rails.application.routes.draw do
  root to: "articles#top"
  resources :request_themes
  # resources :users, only: [:show]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :articles do
    collection do
      get "top"
    end
    resources :comments
    resources :favorites, only: [:create, :destroy] 
  end
  
  # devise_for :users
  #? 利用するモジュールのコントローラーを指定する
  # 今回はデフォルトで有効なpasswords、registrations、sessionsの3つを指定

    # devise_for :users, controllers: {
    # passwords: 'users/passwords',
    # registrations: 'users/registrations',
    # sessions: 'users/sessions'}

  devise_for :users, controllers: { registrations: 'users/registrations' }
  get "user" => "users#show"
  get "article" => "articles#top"

  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/guest_admin_sign_in', to: 'users/sessions#guest_admin_sign_in'
  end
  # mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end


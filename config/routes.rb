Rails.application.routes.draw do
  resources :request_themes
  # resources :users, only: [:show]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # root to: "devise/sessions#new"
  resources :articles do
    resources :comments
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

  devise_scope :user do
    root to: "devise/sessions#new"
  end
  #デバイスのログインのこと？
  # devise_scope :user do
  #   post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  #   post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  # end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end


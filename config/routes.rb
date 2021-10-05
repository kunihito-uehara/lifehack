Rails.application.routes.draw do
  devise_for :users
  root 'comments#index'
  resources :comments
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end

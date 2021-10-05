Rails.application.routes.draw do
  root 'comments#index'
  resources :comments
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end

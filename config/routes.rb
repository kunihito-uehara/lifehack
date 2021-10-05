Rails.application.routes.draw do
  resources :comments
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end

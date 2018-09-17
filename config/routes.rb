Rails.application.routes.draw do
  root to: "posts#top"
  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
    member do
      get :favorites
    end
  end
  resources :posts do
    collection do
      post :confirm
    end
  end
  resources :likes, only: [:create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end

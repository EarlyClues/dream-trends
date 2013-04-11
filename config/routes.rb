DreamTrends::Application.routes.draw do
  devise_for :users
  resources :dreams
  resources :trends

  root to: "home#index"
end

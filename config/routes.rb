Rails.application.routes.draw do
  devise_for :users
  root "articles#index"
  resources :articles do #заменяет два get (get "/articles", to: "articles#index"
#и get "/articles:id", to: "articles#show")
    resources :comments
    resources :users
end
end

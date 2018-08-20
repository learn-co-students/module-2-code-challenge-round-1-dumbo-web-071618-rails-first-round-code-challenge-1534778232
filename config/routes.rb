Rails.application.routes.draw do
  resources :powers, only: [:index,:show]
  resources :heroines, only: [:index, :new, :create]

  get "/heroines/search", to: 'heroines#search', as: "search"
  get "/heroines/:id", to: 'heroines#show', as: "heroine"
end

Rails.application.routes.draw do
  resources :powers, only: [:index,:new,:create,:show]
  resources :heroines, only: [:index,:new,:create,:show]  
end

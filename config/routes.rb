Rails.application.routes.draw do
  resources :powers, only: [:index, :show, :edit, :update, :new, :create]
  resources :heroines, only: [:index, :show, :edit, :update, :new, :create]  
end

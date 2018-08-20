Rails.application.routes.draw do
  resources :powers
  resources :heroines 
  #post '/heroines/new', to: 'heroines#create'
   
end

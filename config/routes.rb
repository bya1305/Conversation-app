Rails.application.routes.draw do
  resources :messages
  resources :conversations
  devise_for :users
  root 'welcome#landing'
  get '/home' => 'welcome#home'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

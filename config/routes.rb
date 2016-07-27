Rails.application.routes.draw do
  devise_for :users
  resources :articles do
    resources :comments 
  end
  get 'welcome/index'
  get "mierdo", to: "welcome#index"
  root 'welcome#index'
end

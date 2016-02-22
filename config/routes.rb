Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show] do
    resources :topics
  end

  post :incoming, to: 'incoming#create'

  get 'welcome/index'
  get 'welcome/about'

  root to: 'welcome#index'
end

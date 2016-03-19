Rails.application.routes.draw do

  get 'likes/index'

  get 'users/show'

    devise_for :users
    resources :users, only: [:show] do
      get 'welcome/index'
    resources :topics
      resources :bookmarks, except: [:index] do
        resources :likes, only: [:index, :create, :destroy]
    end
  end

  post :incoming, to: 'incoming#create'

  get 'welcome/index'
  get 'welcome/about'

  root to: 'welcome#index'
end

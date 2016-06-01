Rails.application.routes.draw do
  get 'likes/index'

  post :incoming, to: 'incoming#create'

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  resources :bookmarks, only: [] do
    resources :likes, only: [:index, :create, :destroy]
  end

  devise_for :users

  authenticated :user do
    root to: "topics#index", as: "authenticated_root"
  end

  root to: 'welcome#index'
end

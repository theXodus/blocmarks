Rails.application.routes.draw do
  resources :topics do
    resources :bookmarks
  end

  devise_for :users

  authenticated :user do
    root to: "topics#index", as: "authenticated_root"
  end

  root to: 'welcome#index'
end

Rails.application.routes.draw do
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  get 'bookmarks/index'
  get 'bookmarks/cd'
  get 'phina/js'
  get 'build/phina.js', to: 'phina#js'
  get 'games/shooting'
  get 'games/prologue'
  resources :users, only: %i[index new create]
  resources :boards, only: %i[index new create show edit update destroy] do
    resources :comments, only: %i[create new show edit destroy update index], shallow: true
    collection do
      get :bookmarks
    end
  end

  resources :bookmarks, only: %i[create destroy]

  root "static_pages#top"
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end

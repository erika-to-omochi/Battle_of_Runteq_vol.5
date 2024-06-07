Rails.application.routes.draw do
  get 'phina/js'
  get 'build/phina.js', to: 'phina#js'
  get 'games/shooting'
  resources :users, only: %i[index new create]
  resources :boards, only: %i[index new create show] do
    resources :comments, only: %i[create edit destroy index], shallow: true
  end
  get 'boards/index', to: 'boards#index'
  root "static_pages#top"
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end

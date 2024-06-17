Rails.application.routes.draw do
  # Static Pages
  root 'static_pages#top'

  # User Sessions
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  # Users
  resources :users, only: %i[index new create]

  # Boards and Comments
  resources :boards do
    resources :comments, shallow: true
    collection do
      get :bookmarks
    end
  end

  # Bookmarks
  resources :bookmarks, only: %i[create destroy index]

  # Games
  get 'games/shooting'
  get 'games/prologue', to: 'games#prologue'

  # Phina.js
  get 'phina/js', to: 'phina#js'
  get 'build/phina.js', to: 'phina#js'
end

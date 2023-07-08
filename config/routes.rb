Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  get 'password_resets/new'
  get 'password_resets/create'
  get 'password_resets/edit'
  get 'password_resets/update'
  get 'question', to: 'question#question'
  namespace :question do
      get 'choice'
    namespace :spa_quality do
      get 'spa_quality'
      post 'spa_quality_post'
      get 'charactor'
      post 'charactor_post'
      get 'answer'
    end
    namespace :family_bath do
      get 'location'
      post 'location_post'
      get 'choice'
      get 'spa_quality'
      post 'spa_quality_post'
      get 'place'
      post 'place_post'
      get 'answer'
    end
    namespace :charactor do
      get 'spa_quality'
      post 'spa_quality_post'
      get 'charactor'
      post 'charactor_post'
      get 'answer'
    end
  end

  get 'map', to: 'maps#map'

  root 'static_pages#top'

  resources :spas, only: %i[index show] do
    collection do
      get :bookmarks
    end
  end

  resources :bookmarks, only: %i[create destroy]

  get '/api/google_api_key', to: 'api#google_api_key'
  
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  get 'logout', to: 'user_sessions#destroy'
  resources 'users', only: %i[new create]
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]
end

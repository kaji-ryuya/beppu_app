Rails.application.routes.draw do
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

  resources :spas
end

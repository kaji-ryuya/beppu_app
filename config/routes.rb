Rails.application.routes.draw do
  get 'question/index'
  root 'static_pages#top'

  resources :spas
end

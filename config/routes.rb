Rails.application.routes.draw do
  devise_for :users
    resources :users

  get 'welcome/index'

  # Routes namespace something like this?
  # namespace :professor do
  #   root to: 'welcome#index'
  # end
  # namespace :student do
  #   root to: 'welcome#index'
  # end
  root to: 'welcome#index'
end

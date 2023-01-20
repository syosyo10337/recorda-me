# frozen_string_literal: true

Rails.application.routes.draw do
  get '/stats/pie', to: 'statistics#pie'
  get '/stats/line', to: 'statistics#line'

  resources :items, only: %i[index show edit update]
  resources :logs, only: %i[create destroy]
  # POST /logsの後のreloadを想定
  get '/logs', to: 'users#home'

  authenticated :user do
    root 'users#home', as: :authenticated_root
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get '/users', to: 'users#registrations'
  get '/about', to: 'static_pages#about'
  get '/privacy_policy', to: 'static_pages#privacy'
  get '/terms_of_service', to: 'static_pages#service'
  root 'static_pages#home'
  post '/guest', to: 'users#guest'

  namespace :charts do
    get 'all_lines'
    get 'all_pies'
  end

  namespace :api do
    resources :items, only: %i[index update]
  end
end

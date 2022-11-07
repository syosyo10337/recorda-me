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

  # social機能の足がかりとしてとりあえずの実装
  get '/users', to: 'users#index'

  get '/about', to: 'static_pages#about'
  root 'static_pages#home'
end

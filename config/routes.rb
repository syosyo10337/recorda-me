# frozen_string_literal: true

Rails.application.routes.draw do
  get '/stats/pie', to: "statistics#pie"
  get '/stats/line', to: "statistics#line"



  resources :items, only: %i[index edit update]
  resources :logs, only: %i[create destroy]
  get '/about', to: 'static_pages#about'

  authenticated :user do
    root 'users#home', as: :authenticated_root
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # social機能の足がかりとしてとりあえずの実装
  get '/users', to: 'users#index'

  root 'static_pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

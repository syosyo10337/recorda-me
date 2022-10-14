Rails.application.routes.draw do
 
  get '/about', to: 'static_pages#about'
  #as: :user_rootでsign_in後のルートを指定
  #https://github.com/heartcombo/devise/blob/main/lib/devise/controllers/helpers.rb#L213
  devise_for :users
  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

  get '/users/:id', to: 'users#show'

  root 'static_pages#home'




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

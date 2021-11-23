Rails.application.routes.draw do
    devise_for :users
      # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
      root to:'homes#top'
      resources :users, only: [:show,:update,:destroy,:edit] do
          #いいね一覧ページ
          member do
              get :likes
          end
      end
      resources :menus do
       resources :likes, only: [:create, :destroy]
       resources :comments, only: [:create, :destroy]
     end
     get 'search' =>'searches#search'
     get '/map_request', to: 'maps#map', as: 'map_request'

end

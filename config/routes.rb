Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
    devise_for :users
      # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
      root to:'homes#top'
      resources :users, only: [:show,:update,:destroy,:edit] do
          #いいね一覧ページ
        member do
          get :likes
        end
        resources :relationships, only: [:create, :destroy]
          get 'followings' => 'relationships#followings', as: 'followings'
          get 'followers' => 'relationships#followers', as: 'followers'
      end

      resources :menus do
        member do
          get :a
        end
        resources :likes, only: [:create, :destroy]
        resources :comments, only: [:create, :destroy]
     end

     get 'search' =>'searches#search'
     get '/map_request', to: 'maps#map', as: 'map_request'

end

Rails.application.routes.draw do

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    devise_for :users

    get '/' => 'homes#top', as: "root"
    get '/homes/about' => 'homes#about'

    resources :users, only: [:show, :edit, :update] do
        resource :relationships, only: [:create, :destroy]
  	    get 'following' => 'relationships#following', as: 'followings'
    end

    get '/users/unsubscribe/:id' => 'users#unsubscribe', as: "unsubscribe"
    patch '/users/withdraw' => 'users#withdraw'

    resources :articles do
        resources :favorites, only: [:create, :destroy, :index]
        resources :article_comments, only: [:create, :destroy]
    end

end
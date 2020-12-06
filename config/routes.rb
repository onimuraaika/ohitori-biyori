Rails.application.routes.draw do

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    devise_for :users, :controllers => {
      :registrations => 'users/registrations'
    }

    devise_scope :user do
        post 'users/guest_sign_in' => 'users/sessions#create_guest'
    end

    get '/' => 'homes#top', as: "root"
    get '/about' => 'homes#about'

    get '/users/unsubscribe/:id' => 'users#unsubscribe', as: "unsubscribe"
    patch '/users/withdraw' => 'users#withdraw'

    resources :users, only: [:show, :edit, :update] do
        resource :relationships, only: [:create, :destroy]
  	    get 'following' => 'relationships#following', as: 'followings'
  	    get 'followed' => 'relationships#followed', as: 'followed'
    end

    resources :articles do
        resources :favorites, only: [:create, :destroy, :index]
        resources :article_comments, only: [:create, :destroy]
    end
    
    resources :notifications, only: [:index]

end
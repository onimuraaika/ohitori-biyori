Rails.application.routes.draw do
    
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
    get '/' => 'homes#top', as: "root"
    get '/homes/about' => 'homes#tabout'
    
    resources :users, only: [:show, :edit, :update] do
        resource :relationships, only: [:create, :destroy]
  	    get 'following' => 'relationships#following', as: 'following'
    end
    
    get '/users/unsubscribe/:id' => 'users#unsubscribe'
    patch '/users/withdraw' => 'users#withdraw'
    
    resources :articles do
        resources :favorites, only: [:create, :destroy, :index]
        resources :article_comments, only: [:create, :destroy]
    end
    
end
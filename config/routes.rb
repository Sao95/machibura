Rails.application.routes.draw do
  root 'homes#top'
  
  # 特定のコントローラーがどこに存在するかを指定する
  # skip オプションで不要なルーティングを削除 
  devise_for :users,skip: [:passwords,], controllers: {
  registrations: "users/registrations",
  sessions: 'users/sessions'
  }
  
  resources :users, only: [:index, :show, :edit, :update] do
    resources :post_comments, only: [:index] do
      member do
        delete 'destroy_from_index'
      end
    end
    resources :favorites, only: [:index]
  end
  get 'unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  patch 'withdraw' => 'users#withdraw', as: 'withdraw'
  
  resources :posts, only: [:index, :new, :create, :show, :destroy] do
    member do
      delete 'destroy_from_user_show'
    end
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  get 'search', to: 'posts#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

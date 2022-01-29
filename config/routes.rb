Rails.application.routes.draw do

  root 'homes#top'

  # 特定のコントローラーがどこに存在するかを指定する
  devise_for :admin, skip: [:passwords, :registrations], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :users, only: [:index, :show, :update, :destroy]
    resources :posts, only: [:index, :show, :update, :destroy]
    resources :post_comments, only: [:index, :destroy]
  end

  # 特定のコントローラーがどこに存在するかを指定する
  # skip オプションで不要なルーティングを削除
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "users/registrations",
    sessions: 'users/sessions'
  }

  # get '/users' => redirect("/users/sign_up")
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
    collection do
      get 'runking'
    end
    member do
      delete 'destroy_from_user_show'
    end
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  resources :contacts, only: [:new, :create] do
    collection do
      post 'confirm', to: 'contacts#confirm'
      get 'confirm', to: 'contacts#new'
      post 'back', to: 'contacts#back'
      get 'back', to: 'contacts#new'
      get 'complete', to: 'contacts#complete'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

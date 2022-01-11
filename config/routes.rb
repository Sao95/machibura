Rails.application.routes.draw do
  root 'homes#top'
  
  # 特定のコントローラーがどこに存在するかを指定する
  # skip オプションで不要なルーティングを削除  ,skip: [:passwords,]
  devise_for :users, controllers: {
  registrations: "users/registrations",
  sessions: 'users/sessions'
  }
  
  resources :users, only: [:show, :edit, :update]
  get 'unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  patch 'withdraw' => 'users#withdraw', as: 'withdraw'
  
  resources :posts
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

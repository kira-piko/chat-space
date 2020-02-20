Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
 
  resources :users, only: [:index,:edit, :update]
  resources :groups, only: [:new, :create, :edit, :update] do
    resources :messages, only: [:index, :create]
    
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
  end
end
# defaultsオプションを利用して、このルーティングが来たらjson形式でレスポンスするよう指定しています。
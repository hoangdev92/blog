Rails.application.routes.draw do
  root 'home#index'
  devise_for :users,
             path: '',
             path_names: { sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'resgistration' },
             controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  mount Ckeditor::Engine => '/ckeditor'
  resources :posts

  resources :users do
    member do
      get :edit
      post :update
    end
  end
  get '/chat', to: 'chats#chat', as: :chat_user
  resources :chats, only: [:chat]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

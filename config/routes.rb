Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  root to: 'top#index'

  resources :items do
    collection do
      get 'pay/:id' => 'items#pay'
      post 'buy/:id' => 'items#buy', as: 'buy'
    end
  end

  resources :users do
    collection do
      get 'logout'
      get 'card'
      # get 'confirm'
    end
  end

  resources :credit_cards, only: [:new, :show] do
    collection do
      post 'show'
      post 'pay'
      post 'delete'
    end
  end

  get "signup", to:"signup#index"
  resources :signup do
    collection do
      get 'step1'
      post 'step2'
      post 'step3'
      post 'step4'
      get 'complete_signup'
      post 'pay'
    end
  end

  resources :residences, only: [:edit, :update]

end

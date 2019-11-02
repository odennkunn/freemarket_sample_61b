Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'top#index'

  resources :items do
    collection do
      get 'pay'
    end
  end

  resources :users do
    collection do
      get 'edit'
      get 'logout'
      get 'card'
      get 'confirm'
    end
  end

  get "signup", to:"signup#index"
  get "signup", to:"signup#login"
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      get 'step5'
      get 'complete_signup'
    end
  end

end

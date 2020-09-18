Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: 'users/registrations',
    sessions: 'users/sessions'   
  }

  root 'events#index'
  resources :events do
    collection do
      get 'timeline'
    end

    resources :messages, only: [:index, :create]
  end
  resources :users, only: [:show]
  resources :relationships
  resources :items do
    collection do
      post 'pay/:id' => 'items#pay', as: 'pay'
    end
  end
end
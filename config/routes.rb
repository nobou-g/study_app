Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: 'users/registrations',
    sessions: 'users/sessions'   
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'events#index'
  resources :events do
    collection do
      get 'timeline' 
    end

    resources :messages, only: [:index, :create]
  end
  resources :users, only: [:show]
  resources :relationships
end
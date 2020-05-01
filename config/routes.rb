Rails.application.routes.draw do
  # get 'credit_cards/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # devise_for :users
  # get 'users/index'
  root 'items#index'
  <<<<<<< create-exhibition-views
  resources :users
  resources :credit_cards
  resources :items
=======
  resources :users do
   resource :logout ,only: [:show]
  end
  resources :credit_cards do
    collection do
      get 'about'
    end
  end


  resource :mypages do
    
  end
  get 'logouts/show'
  # get 'mypages/show'
>>>>>>> master
end

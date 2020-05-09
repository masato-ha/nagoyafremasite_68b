Rails.application.routes.draw do
  
  
  # get 'credit_cards/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    sessions: 'users/sessions'   
  } 
  
  root 'items#index'
  resources :users do
   resource :logout ,only: [:show]
  end
  resources :credit_cards do
    collection do
      get 'about'
    end
  end

  resources :items
  



  resource :mypages
  
  get 'logouts/show'

end


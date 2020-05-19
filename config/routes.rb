Rails.application.routes.draw do
  
  
  # get 'credit_cards/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    sessions: 'users/sessions'   
  } 
  
  resources :items, only: [:index, :show, :new, :edit, :destroy] do
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  root 'items#index'
  resources :users do
   resource :logout ,only: [:show]
  end
  resources :credit_cards do
    collection do
      get 'about'
    end
  end




  
  
  get 'logouts/show'

end


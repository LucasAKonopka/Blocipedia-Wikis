Rails.application.routes.draw do
  
  devise_for :users
  resources :users do
    post 'downgrade_user' => 'users#downgrade_user', as: :downgrade_user
  end
     
  
    
  resources :wikis
  resources :charges, only: [:new, :create]
  
  
  get 'about' => 'welcome#about'
  root to: 'welcome#index'

end

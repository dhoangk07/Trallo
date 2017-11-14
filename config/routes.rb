Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  
  resources :boards do
  	resources :lists 
  	resources :events
  
  end

  resources :lists, only: [] do
  		resources :cards
  	end

  resources :cards, only: [] do
    resources :comments
  end

  root to: 'dashboards#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

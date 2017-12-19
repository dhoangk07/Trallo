Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  
  resources :boards do
  	resources :lists 
  	resources :events
    put :invite_member, on: :member
    post :search, on: :member
  
  end

  resources :users

  resources :lists, only: [] do
		resources :cards do
      put :invite_member, on: :member    #list/22/card/11/invite_member
      delete :remove_member, on: :member
      put :move_card, on: :member
      put :drop_card, on: :member
      get :edit_description, on: :member 
      put :update_description, on: :member  
      put :select_label, on: :member
    end
    put :move_list, on: :member
  end

  resources :cards, only: [] do
    resources :comments 
    resources :labels
  end

  root to: 'dashboards#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

root 'users#index'
  resources :users, only: [:index, :new, :create, :show, :destroy, :edit, :update, :statuses]
  resources :statuses
  resources :likes
  resource :sessions
  resources :welcome

  match 'signout_path', to: 'sessions#destroy', via: [:delete]


end

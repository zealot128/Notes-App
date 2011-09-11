PludoniNotes::Application.routes.draw do
  get "notes/new"

  get "notes/create"

  get "pages/about"

  resources :notes

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  root :to => "notes#index"


end

PludoniNotes::Application.routes.draw do
  resources :notes

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  root :to => "notes#index"


end

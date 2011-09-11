PludoniNotes::Application.routes.draw do
  get "tags/show"

  get "notes/new"

  get "notes/create"

  get "pages/about"

  resources :notes do
    collection do
      get :share
    end
  end
  resources :tags, :only => :show

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  root :to => "notes#index"


end

PludoniNotes::Application.routes.draw do
  post "sessions/switch_color"

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

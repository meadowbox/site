Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "users#new"

  resource :users, only: [:create, :new]
end

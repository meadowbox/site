Rails.application.routes.draw do
  root to: "users#new"

  resource :users, only: [:create, :new]
end

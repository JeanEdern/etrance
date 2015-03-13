Rails.application.routes.draw do
  devise_for :users

  resource 'subscriber', only: :create
end

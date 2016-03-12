Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  resources :snaps do
    resources :comments
  end

  root 'snaps#index'
end

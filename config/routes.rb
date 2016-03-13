Rails.application.routes.draw do
  get 'notifications/:id/link_through', to: 'notifications#link_through', as: :link_through

  devise_for :users, controllers: {registrations: 'registrations'}
  resources :snaps do
    resources :comments
    member do
      get :like
    end
  end

  root 'snaps#index'
end

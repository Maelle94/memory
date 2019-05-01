Rails.application.routes.draw do
  resources :charges
  resources :images do
    collection do
      get ':id/preview', to: 'images#preview', as: 'preview'
    end
  end
  
  resources :cameras do
    collection do
      get ':id/preview', to: 'cameras#preview', as: 'preview'
    end
  end

  resources :categories
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    unlocks: 'users/unlocks',
  }, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'main#home'
  get 'dashboard', to: 'dashboard#administrator'
end

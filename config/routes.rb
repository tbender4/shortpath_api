# frozen_string_literal: true

Rails.application.routes.draw do
  resources :visits
  resources :event_occurrences
  resources :event_organizers
  resources :users
  resources :visitor_types
  devise_for :users
  # resources :building_accounts
  resources :addresses
  resources :group_contacts
  resources :event_guests
  resources :events
  resources :contacts
  resources :buildings, shallow: true do
    resources :floors, shallow: true do
      resources :spaces, shallow: true do
        resources :leases
      end
    end
  end
  resources :groups
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

Rails.application.routes.draw do
  resources :event_organizers
  resources :users
  resources :visitor_types
  devise_for :users
  resources :building_accounts
  resources :addresses
  resources :group_contacts
  resources :event_guests
  resources :events
  resources :contacts
  resources :spaces
  resources :floors
  resources :buildings
  resources :leases
  resources :locationables
  resources :groups
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

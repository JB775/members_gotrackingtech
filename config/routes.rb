Rails.application.routes.draw do

  get "content/silver"
  get "content/gold"
  get "content/platinum"
  mount Payola::Engine => '/payola', as: :payola
  root to: 'visitors#show'
  get 'products/:id', to: 'products#show', :as => :products
  devise_for :users, :controllers => { :registrations => 'registrations' }
  devise_scope :user do
    put 'change_plan', :to => 'registrations#change_plan'
  end
  resources :users

    # Landing Pages
  get 'about', :to => 'visitors#about'
  get 'dispatch', :to => 'visitors#dispatch'
  get 'features', :to => 'visitors#features'
  get 'gps', :to => 'visitors#gps'
  get 'pricing', :to => 'visitors#pricing'
  get 'privacy', :to => 'visitors#privacy'
  get 'testing', :to => 'visitors#testing'
  # get 'map', :to => 'visitors#map'
  get 'routehistory', :to => 'visitors#routehistory'
  get 'show', :to => 'visitors#show'

    # Dashboard Page
  get 'mydashboard', :to => 'datadashboards#dash'
  get 'stockdash', :to => 'datadashboards#stockdash'
  get 'map', :to => 'datadashboards#map'

end

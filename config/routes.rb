Rails.application.routes.draw do

  resources :keywords
  # SMS Endpoint
  post 'sms', to: 'sms#process'

  # Keyword Management

  # Phone Number Management

  # Authentication
  devise_for :admins

  # Static Pages
  get 'about', to: 'welcome#about'

  root to: 'welcome#index'
end

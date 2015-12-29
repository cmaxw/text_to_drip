Rails.application.routes.draw do
  # SMS Endpoint
  post 'sms', to: 'sms#process_sms'

  # Keyword Management
  resources :keywords

  # Phone Number Management

  # Authentication
  devise_for :admins

  # Static Pages
  get 'about', to: 'welcome#about'

  root to: 'welcome#index'
end

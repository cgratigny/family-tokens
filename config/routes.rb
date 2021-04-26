Rails.application.routes.draw do
  namespace :admin do
    resources :time_logs
    resources :kids
    resources :activities
  end

  resources :kids
  resources :time_logs
end

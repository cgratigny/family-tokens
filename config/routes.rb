Rails.application.routes.draw do
  namespace :admin do
    resources :time_logs
    resources :kids
    resources :activities
  end

get '/', to: 'kids#index'
  resources :kids
  resources :time_logs
end

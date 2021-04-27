Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations", :passwords => "passwords"  }

  namespace :admin do
    get '/', to: 'kids#index'
    resources :time_logs
    resources :kids
    resources :activities
    resource :family
  end

  root to: "kids#index"
  resources :kids
  resources :time_logs
  resource :family_code
end

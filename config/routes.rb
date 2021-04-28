Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations", :passwords => "passwords"  }

  namespace :parents do
    get '/', to: 'kids#index'
    resources :time_logs
    resources :kids
    resources :activities

    resource :family
    resource :signup
    resource :family_signup
    resource :activity_signup
    resource :kid_signup
  end

  root to: "kids#index"
  resources :kids
  resources :time_logs
  resource :family_code
end

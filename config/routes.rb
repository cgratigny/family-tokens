Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations", :passwords => "passwords"  }

  resource :welcome

  namespace :admin do
    get '/', to: 'families#index'
    resources :families
  end

  namespace :parents do
    get '/', to: 'dashboards#show'
    resources :time_logs
    resources :kids
    resources :activities

    resource :dashboard
    resource :family
    resource :signup
    resource :family_signup
    resource :activity_signup
    resource :kid_signup
    resources :transactions
    resources :redemptions

    resources :rewards
    resources :redemptions
  end

  namespace :kids do
    get '/', to: 'kids#index'
    resources :kids
    resources :time_logs
    resource :family_code
  end

  root to: "welcomes#show"
end

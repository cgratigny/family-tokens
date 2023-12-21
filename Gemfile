source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '~> 7.1.2'

gem 'sprockets-rails', :require => 'sprockets/railtie'

# Use Puma as the app server
gem 'puma'

gem 'redis'

# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem "after_party"

gem 'money-rails'

# rails pipeline
gem "importmap-rails"

# handle nested forms
gem "cocoon"

# Provides hamlit generators for Rails. It also enables hamlit as the templating engine and "hamlit:erb2haml" rake task that converts erb files to haml.
gem 'hamlit-rails'

# allows us to use rake hamlit:erb2haml to convert any stray erb files to haml
gem 'html2haml' 

# A framework for creating reusable, testable & encapsulated view components, built to integrate seamlessly with Ruby on Rails.
gem "view_component"

# authentication gem
gem 'devise'

gem "sidekiq"

gem "mongoid"
gem 'mongoid-multitenancy'
gem 'mongoid-history'

gem "amazing_print"

gem 'simple_form'

# list filter
gem "datagrid", git: 'https://github.com/cgratigny/datagrid.git'
gem "kaminari"
gem "kaminari-mongoid"
gem "mongoid_search"

# to handle complex enum objects
gem 'classy_enum'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'debugger' anywhere in the code to stop execution and get a debugger console
  gem "debug", ">= 1.0.0", platforms: [:mri, :mingw, :x64_mingw]
end

# cron gem
gem "whenever"

group :development do
  # For memory profiling
  gem 'memory_profiler'

  # For call-stack profiling flamegraphs
  gem 'stackprof'
  gem 'rack-mini-profiler'
  gem 'flamegraph'

  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  # gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring

  gem 'spring'

  gem 'better_errors'
  gem "binding_of_caller"

  gem "capistrano-rails"
  gem 'capistrano-bundler', '~> 1.6'
  gem "capistrano-rvm"
  gem "capistrano-ssh-doctor", "~> 1.0"
  gem 'capistrano-rake', require: false
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "tailwindcss-rails", "~> 2.1"
gem 'sassc-rails'

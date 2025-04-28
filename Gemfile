# frozen_string_literal: true

source 'https://rubygems.org'

gem 'json'
gem 'puma'
gem 'sinatra'
gem 'sinatra-contrib'

# Database
gem 'activerecord'
gem 'sinatra-activerecord'
gem 'sqlite3'

# Development
group :development, :test do
  gem 'pry', require: false
  gem 'rackup', '~> 2.2', require: false
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubocop-sorbet', require: false
  gem 'sorbet', require: false
  gem 'tapioca', require: false
  # Testing
  gem 'rspec', '~> 3.12'
  gem 'factory_bot', '~> 6.4'
  gem 'faker', '~> 3.2'
  gem 'rack-test', '~> 2.1'
  gem 'rake', '~> 13.1'
  gem 'database_cleaner-active_record', '~> 2.1'
end

# Runtime
group :runtime do
  gem 'sorbet-runtime'
end

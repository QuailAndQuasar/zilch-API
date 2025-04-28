# frozen_string_literal: true

require 'rack/test'
require 'factory_bot'
require 'faker'
require 'database_cleaner/active_record'

ENV['RACK_ENV'] = 'test'

require_relative '../app'

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
    FactoryBot.find_definitions
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end

def app
  Sinatra::Application
end

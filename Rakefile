# frozen_string_literal: true

require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require './app'

namespace :db do
  desc 'Create the database'
  task :create do
    ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.sqlite3')
    ActiveRecord::Base.connection
  end

  desc 'Run migrations'
  task :migrate do
    ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.sqlite3')
    ActiveRecord::Migration.verbose = true
    ActiveRecord::MigrationContext.new('db/migrate').migrate
  end

  desc 'Create a new migration'
  task :create_migration, [:name] do |_t, args|
    if args[:name].nil?
      puts 'You must specify a migration name'
      exit 1
    end

    timestamp = Time.now.strftime('%Y%m%d%H%M%S')
    filename = "db/migrate/#{timestamp}_#{args[:name]}.rb"

    FileUtils.mkdir_p('db/migrate')

    File.write(filename, <<~RUBY)
      class #{args[:name].camelize} < ActiveRecord::Migration[6.0]
        def change
        end
      end
    RUBY

    puts "Created migration: #{filename}"
  end

  task :load_config do
    require './app'
  end
end

namespace :routes do
  desc 'List all Sinatra routes'
  task :list do
    require 'sinatra/base'
    require './app'

    Sinatra::Base.routes.each do |method, routes|
      routes.each do |route|
        puts "#{method.upcase} #{route[0]}"
      end
    end
  end
end

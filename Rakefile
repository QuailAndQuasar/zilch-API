require 'sinatra/activerecord'
require './app'

namespace :db do
  desc "Create the database"
  task :create do
    ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.sqlite3')
    ActiveRecord::Base.connection
  end

  desc "Run migrations"
  task :migrate do
    ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.sqlite3')
    ActiveRecord::Migration.verbose = true
    ActiveRecord::MigrationContext.new('db/migrate').migrate
  end

  desc "Create a new migration"
  task :create_migration, [:name] do |t, args|
    if args[:name].nil?
      puts "You must specify a migration name"
      exit 1
    end

    timestamp = Time.now.strftime("%Y%m%d%H%M%S")
    filename = "db/migrate/#{timestamp}_#{args[:name]}.rb"
    
    FileUtils.mkdir_p('db/migrate')
    
    File.open(filename, 'w') do |f|
      f.write <<~RUBY
        class #{args[:name].camelize} < ActiveRecord::Migration[6.0]
          def change
          end
        end
      RUBY
    end
    
    puts "Created migration: #{filename}"
  end
end 
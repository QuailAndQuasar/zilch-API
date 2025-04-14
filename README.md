# Sinatra API

A simple Sinatra API project with basic endpoints and ActiveRecord integration.

## Installation

1. Make sure you have Ruby installed (version 2.7 or higher recommended)
2. Install Bundler if you don't have it:
```bash
gem install bundler
```

3. Install project dependencies:
```bash
bundle install
```

4. Set up the database:
```bash
# Create the database
rake db:create

# Run migrations
rake db:migrate
```

## Starting the Server

To start the Sinatra server, run:
```bash
ruby app.rb
```

The server will start on `http://localhost:4567`

## Available Endpoints

- `GET /` - Welcome message
- `GET /users` - List all users
- `GET /users/:id` - Get a specific user
- `POST /users` - Create a new user
- `POST /data` - Accepts JSON data and returns it
- `GET /hello/:name` - Returns a personalized greeting

## Example Usage

```bash
# Test the root endpoint
curl http://localhost:4567/

# Create a new user
curl -X POST -H "Content-Type: application/json" -d '{"name":"John Doe","email":"john@example.com"}' http://localhost:4567/users

# List all users
curl http://localhost:4567/users

# Get a specific user
curl http://localhost:4567/users/1

# Test the POST endpoint
curl -X POST -H "Content-Type: application/json" -d '{"key":"value"}' http://localhost:4567/data

# Test the hello endpoint
curl http://localhost:4567/hello/World
```

## Development

To create a new migration:
```bash
rake "db:create_migration[create_table_name]"
```

Then edit the generated migration file in `db/migrate/` and run:
```bash
rake db:migrate
```

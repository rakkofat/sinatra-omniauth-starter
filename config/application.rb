# For development and testing environments, run the following code
configure :development, :test do
  # Load environment variables from .env file
  require 'dotenv'
  Dotenv.load

  # Load the following libraries
  require 'pry'
end

configure :production do
  require 'rack/ssl'
  use Rack::SSL
end

# For all environments, run the following code
configure do
  # Load the following libraries
  require 'sinatra/activerecord'
  require 'sinatra/flash'
  require 'sinatra/reloader'
  require 'sanitize'
  require 'omniauth-github'

  # Load all .rb files in the app folder
  Dir[__dir__ + "/../app/**/*.rb"].each do |file|
    require_relative file
  end

  # Allow sessions and set a session secret
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET']

  # Declare the location of the views folder
  set :views, 'app/views'

  # Set Github as an OmniAuth provider
  use OmniAuth::Builder do
    provider :github, ENV['GITHUB_CLIENT_ID'], ENV['GITHUB_CLIENT_SECRET']
  end
end

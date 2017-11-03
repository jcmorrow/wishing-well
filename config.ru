require "rack"
require "rack/cors"

# This file is used by Rack-based servers to start the application.
use Rack::Cors do
  allow do
    origins 'localhost:8000'
    resource '*',
        :methods => [:get]
  end
end

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application

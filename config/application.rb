require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Valetbike
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    Rails.configuration.stripe = {
      secret_key: 'sk_test_51OHeAKJg0jV0uG9HUAjcIWLdc8o3wI9JhquxRKLBuAXqpUmbixPPY56GClzTbdRGF5NbHdxj3lnpCtn0SV0TL6cR00VSZ0Jf5h',
    publishable_key: 'pk_test_51OHeAKJg0jV0uG9HFob6ddEw6UmDY1dEM80lWeO93jIx5GKD5XnKFWPQlVkCp3Xno7nq8FFSAq0ftN7p8x3fLBc100gLoVMuXR',
    }
    Stripe.api_key = Rails.configuration.stripe[:secret_key]
  end
end



# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey', # This is the string literal 'apikey', NOT the ID of your API key
  :password => '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', # This is the secret sendgrid API key which was issued during API key creation
  :domain => 'http://127.0.0.1:3000',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
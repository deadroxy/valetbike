
# Rails.application.config.middleware.use OmniAuth::Builder do
#     provider :google_oauth2, Rails.application.credentials.google[:client_id], Rails.application.credentials.google[:client_secret], {
#       scope: 'email, profile',
#       redirect_uri: 'http://localhost:3000/users/auth/google_oauth2/callback'
#     }
#     provider :facebook, Rails.application.credentials.facebook[:app_id], Rails.application.credentials.facebook[:app_secret], {
#       scope: 'email',
#       redirect_uri: 'http://localhost:3000/users/auth/facebook/callback'
#     }
#   end
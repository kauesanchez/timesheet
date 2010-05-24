# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_225_colgate-surveys_session',
  :secret      => 'c47a5f9529bef5d0a87ba73c22c098dfc94fa494d656a049e7e407a508a7059593571f30b80717cb5e8db3a0a963ed93a7cdf3d3eb02c4a2f9c0c9eca276405e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

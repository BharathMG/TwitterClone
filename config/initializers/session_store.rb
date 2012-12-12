# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ProjectName_session',
  :secret      => '16c545e2c718eb5f644e8757ffc2553e4f36dd37df5aa57902ff414fb304002d888284ebc0091b4c3d1bf4bf3ddcc1a9c009277d9be40c817e4de4e473d59568'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

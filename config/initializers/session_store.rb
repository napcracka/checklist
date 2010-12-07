# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_checklist_session',
  :secret      => 'ce1089f8a8b85284fc5cef0d0e8a1367f7d4e9388aae284883ded9a1fefeb2f9427cf05954b841f1329301155df546acab50fe51ff5fcc503d0125d37a5b2c41'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

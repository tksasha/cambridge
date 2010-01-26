# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cambridge_session',
  :secret      => 'afefcc45eff33b7aa060fa3f9672cb2360bbfb18f4da45e79096314a66ada563c15e64b271aa7733a36142c3a4665644ca2606fc35abbfa100a7f22861377b27'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

# config/initializers/secret_token.rb

# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
MyUniver::Application.config.secret_token = ENV['ed6f4e79eb98468b2221218759814577d546193fbc3452342795110aa6fb6f98211e32fd3f3096a53d675f669c9f9da448da7a215ee3796406112e4572511777']

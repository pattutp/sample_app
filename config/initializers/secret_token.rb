# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.


require 'securerandom'
def secure_token
token_file = Rails.root.join('.secret')
if File.exist?(token_file)
## Use the existing token.
File.read(token_file).chomp
else
## Generate a new token and store it in token_file.
token = SecureRandom.hex(64)
File.write(token_file, token)
token
end
end
SampleApp::Application.config.secret_key_base = secure_token

#SampleApp::Application.config.secret_key_base = '60aaa4f82ed09cffd3c1bca744eec4437bc326fa40802f546c0163a48c73bbede4196cb632739bfda5efaf990a2aed62717068ffa7b8a215cf6cd84a956a7a7b'

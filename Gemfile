# frozen_string_literal: true

source 'https://rubygems.org'
ruby '3.3.6'

# Core gems
gem 'puma'
gem 'sinatra'
gem 'sinatra-contrib'

# API functionality
gem 'faker'
gem 'json'

# Production requirements
gem 'rack-ssl-enforcer'

group :test, :development do
  gem 'bundler-audit', require: false
  gem 'minitest'
  gem 'minitest-reporters'
  gem 'rack-test'
  gem 'rubocop', require: false
  gem 'rubocop-minitest', require: false
  gem 'rubocop-performance', require: false
end

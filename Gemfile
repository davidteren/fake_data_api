# frozen_string_literal: true

source 'https://rubygems.org'
ruby '3.3.6'

# Core gems
gem 'sinatra'
gem 'sinatra-contrib'
gem 'puma'

# API functionality
gem 'faker'
gem 'json'

# Production requirements
gem 'rack-ssl-enforcer'

group :test, :development do
  gem 'minitest'
  gem 'rack-test'
  gem 'minitest-reporters'
  gem 'rubocop', require: false
  gem 'rubocop-minitest', require: false
  gem 'rubocop-performance', require: false
  gem 'bundler-audit', require: false
end

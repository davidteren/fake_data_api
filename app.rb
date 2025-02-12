# frozen_string_literal: true

require 'sinatra'
require 'sinatra/json'
require 'faker'

# Enable CORS
before do
  content_type :json
  headers 'Access-Control-Allow-Origin' => '*',
          'Access-Control-Allow-Methods' => %w[OPTIONS GET POST]
end

# Landing page
get '/' do
  content_type :html
  erb :index
end

# API Documentation page
get '/docs' do
  content_type :html
  erb :docs
end

# API Endpoints
# Generate a single person
get '/api/person' do
  json generate_person
end

# Generate multiple people
get '/api/people/:count' do |count|
  count = count.to_i.clamp(1, 10)
  people = Array.new(count) { generate_person }
  json people
end

private

def generate_person
  {
    id: Faker::Number.unique.number(digits: 10).to_s,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    address: {
      street: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      zip: Faker::Address.zip_code,
      country: Faker::Address.country
    },
    company: {
      name: Faker::Company.name,
      position: Faker::Job.title
    },
    avatar: Faker::Avatar.image
  }
end

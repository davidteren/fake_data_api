# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'minitest/reporters'
require 'rack/test'
require_relative '../app'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

module Minitest
  class Test
    include Rack::Test::Methods

    def app
      Sinatra::Application
    end
  end
end

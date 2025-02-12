# frozen_string_literal: true

require_relative 'test_helper'

class AppTest < Minitest::Test
  def test_root_returns_200
    get '/'

    assert_equal 200, last_response.status
    assert_includes last_response.body, 'Welcome to Fake Data API'
  end

  def test_docs_returns_200
    get '/docs'

    assert_equal 200, last_response.status
    assert_includes last_response.body, 'API Documentation'
  end

  def test_get_single_person
    get '/api/person'

    assert_equal 200, last_response.status

    person = JSON.parse(last_response.body)

    assert_kind_of Hash, person
    assert_includes person.keys, 'first_name'
    assert_includes person.keys, 'last_name'
    assert_includes person.keys, 'email'
    assert_includes person.keys, 'address'
    assert_includes person.keys, 'company'

    # Test address structure
    assert_kind_of Hash, person['address']
    assert_includes person['address'].keys, 'street'
    assert_includes person['address'].keys, 'city'
    assert_includes person['address'].keys, 'state'

    # Test company structure
    assert_kind_of Hash, person['company']
    assert_includes person['company'].keys, 'name'
    assert_includes person['company'].keys, 'position'
  end

  def test_get_multiple_people
    [1, 5, 10].each do |count|
      get "/api/people/#{count}"

      assert_equal 200, last_response.status

      people = JSON.parse(last_response.body)

      assert_kind_of Array, people
      assert_equal count, people.length

      # Test first person in the array
      person = people.first

      assert_kind_of Hash, person
      assert_includes person.keys, 'first_name'
      assert_includes person.keys, 'last_name'
    end
  end

  def test_people_count_limit
    get '/api/people/15' # Try to get more than the limit

    assert_equal 200, last_response.status

    people = JSON.parse(last_response.body)

    assert_equal 10, people.length # Should be clamped to 10
  end

  def test_invalid_routes
    get '/nonexistent'

    assert_equal 404, last_response.status
  end

  def test_person_data_types
    get '/api/person'
    person = JSON.parse(last_response.body)

    assert_kind_of String, person['first_name']
    assert_kind_of String, person['last_name']
    assert_kind_of String, person['email']
    assert_kind_of String, person['phone']
    assert_kind_of String, person['id']
    assert_kind_of Hash, person['address']
    assert_kind_of Hash, person['company']
  end
end

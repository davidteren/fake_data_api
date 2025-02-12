# frozen_string_literal: true

require_relative 'test_helper'

class AppTest < Minitest::Test
  def test_root_returns_ok_status
    get '/'

    assert_equal 200, last_response.status
    assert_includes last_response.body, 'Welcome to Fake Data API'
  end

  def test_docs_returns_ok_status
    get '/docs'

    assert_equal 200, last_response.status
    assert_includes last_response.body, 'API Documentation'
  end

  # Split test_get_single_person into smaller, focused tests
  def test_single_person_response_status
    get '/api/person'

    assert_equal 200, last_response.status
  end

  def test_single_person_basic_structure
    get '/api/person'
    person = JSON.parse(last_response.body)

    assert_kind_of Hash, person
    assert_includes person.keys, 'first_name'
    assert_includes person.keys, 'last_name'
  end

  def test_single_person_address_structure
    get '/api/person'
    person = JSON.parse(last_response.body)

    assert_kind_of Hash, person['address']
    assert_includes person['address'].keys, 'street'
    assert_includes person['address'].keys, 'city'
  end

  def test_single_person_company_structure
    get '/api/person'
    person = JSON.parse(last_response.body)

    assert_kind_of Hash, person['company']
    assert_includes person['company'].keys, 'name'
    assert_includes person['company'].keys, 'position'
  end

  # Split test_get_multiple_people into smaller tests
  def test_multiple_people_response_status
    get '/api/people/5'

    assert_equal 200, last_response.status
  end

  def test_multiple_people_count_accuracy
    [1, 5, 10].each do |count|
      get "/api/people/#{count}"
      people = JSON.parse(last_response.body)

      assert_kind_of Array, people
      assert_equal count, people.length
    end
  end

  def test_multiple_people_structure
    get '/api/people/1'
    people = JSON.parse(last_response.body)
    person = people.first

    assert_kind_of Hash, person
    assert_includes person.keys, 'first_name'
    assert_includes person.keys, 'last_name'
  end

  def test_people_count_limit
    get '/api/people/15'

    assert_equal 200, last_response.status
    people = JSON.parse(last_response.body)
    assert_equal 10, people.length
  end

  def test_invalid_routes
    get '/nonexistent'

    assert_equal 404, last_response.status
  end

  # Split test_person_data_types into smaller tests
  def test_person_string_fields
    get '/api/person'
    person = JSON.parse(last_response.body)

    %w[first_name last_name email phone id].each do |field|
      assert_kind_of String, person[field]
    end
  end

  def test_person_complex_fields
    get '/api/person'
    person = JSON.parse(last_response.body)

    %w[address company].each do |field|
      assert_kind_of Hash, person[field]
    end
  end
end

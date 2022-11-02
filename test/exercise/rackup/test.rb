

require './test/test_helper'
require 'test/unit'
require 'rack/test'
require_relative './inatra'
require_relative './my_app'

class RackTest < Test::Unit::TestCase
  def test_it_says_hello_world
    browser = Rack::Test::Session.new(Rack::MockSession.new(Inatra))
    browser.get '/hello'
      assert browser.last_response.ok?
      assert_equal 'Hello World', browser.last_response.body
    browser.post '/hello1', {name: 'Petr'}
      assert browser.last_response.ok?
      assert_equal 'Hello World2', browser.last_response.body
  end
end
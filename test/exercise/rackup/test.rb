require './test/test_helper'
require 'test/unit'
require 'rack/test'
require_relative './inatra'
require_relative './my_app'

class RackTest < Test::Unit::TestCase
  def test_it_says_hello_world
    omit do
      browser = Rack::Test::Session.new(Rack::MockSession.new(Inatra))
      browser.get '/hello'
      assert browser.last_response.ok?
      assert_equal 'Hello World', browser.last_response.body
    end
  end

  def test_it_pongs
    omit do
      browser = Rack::Test::Session.new(Rack::MockSession.new(Inatra))
      browser.get '/ping'
      assert browser.last_response.ok?
      assert_equal 'PONG', browser.last_response.body
    end
  end

  def test_it_says_bye
    omit do
      browser = Rack::Test::Session.new(Rack::MockSession.new(Inatra))
      browser.post '/bye'
      assert browser.last_response.ok?
      assert_equal 'Bye Bye', browser.last_response.body
    end
  end

  def test_it_handles_404
    omit do
      browser = Rack::Test::Session.new(Rack::MockSession.new(Inatra))
      browser.get '/missing_method'
      assert browser.last_response.not_found?
      assert_equal 'Not Found', browser.last_response.body
    end
  end
end

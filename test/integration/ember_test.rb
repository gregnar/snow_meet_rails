require_relative "../test_helper"
require "minitest/spec"
require 'capybara/rails'
require 'capybara/poltergeist'

class EmberTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    Capybara.javascript_driver = :poltergeist
  end

  def teardown
    Capybara.use_default_driver
  end

  def test_pizza
    visit "http://localhost:4200/groups/2/trips/1"
    assert page.has_content?("Vail Ski Resort")
  end
end

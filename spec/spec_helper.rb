# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
require 'rubygems'
require 'simplecov'

SimpleCov.start 'rails' do
  add_filter 'lib/templates'
end

ENV['RAILS_ENV'] = 'test'

require File.expand_path('../../config/environment', __FILE__)

require 'rspec/rails'
require 'yarjuf'
require 'capybara/rspec'
require 'devise'

RSpec.configure do |config|

  config.include Capybara::DSL

  config.global_fixtures = :all
  config.fixture_path = Rails.root.join('spec', 'fixtures')

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end

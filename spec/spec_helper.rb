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

ActiveRecord::Migration.maintain_test_schema!


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

  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

end


# This file is copied to spec/ when you run 'rails generate rspec:install'
# The different available types are documented in the features, such as in
# https://relishapp.com/rspec/rspec-rails/docs


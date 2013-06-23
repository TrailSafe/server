require 'simplecov'
SimpleCov.start :rails

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.infer_base_class_for_anonymous_controllers = false
  config.before :suite do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end

  config.before :each do
    if example.metadata[:clean_db]
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.start
    end
  end

  config.after :each do
    if example.metadata[:clean_db]
      DatabaseCleaner.clean
    end
  end
end

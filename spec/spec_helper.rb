# frozen_string_literal: true

require "currencyapi"
require "date"
require "pry"

require_relative "support/get_json_file"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.include(Support::GetJsonFile)
  
  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

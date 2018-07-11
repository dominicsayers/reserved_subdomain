require 'simplecov'
require 'simplecov-console'
SimpleCov.formatter = SimpleCov::Formatter::Console
SimpleCov.start

require 'reserved_subdomain'

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.order = 'random'
end

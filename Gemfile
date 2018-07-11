# frozen_string_literal: true

source 'https://rubygems.org'

gemspec

group :test do
  gem 'rspec'
  gem 'simplecov-console'
end

local_gemfile = 'Gemfile.local'
eval(File.read(local_gemfile)) if File.exist?(local_gemfile) # rubocop:disable Security/Eval

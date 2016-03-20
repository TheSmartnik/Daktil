# Require this file for unit tests
ENV['HANAMI_ENV'] ||= 'test'

require_relative '../config/environment'
require 'minitest/autorun'
require 'vcr'
require 'minitest-vcr'
require 'webmock'
require 'sidekiq/api'
require 'pry'

# require 'minitest/minitest-spec-context'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
end

Hanami::Application.preload!
MinitestVcr::Spec.configure!

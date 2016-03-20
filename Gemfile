source 'https://rubygems.org'

gem 'bundler'
gem 'rake'

gem 'hanami', '0.7.2'
gem 'hanami-model'
gem 'hanami-utils', git: 'https://github.com/TheSmartnik/utils', branch: 'fix_rses_ending'
gem 'slim'

gem 'redis', '~>3.2'
gem 'sidekiq', '~> 3.4.2'
gem 'sidetiq'

gem 'pg'

gem 'pry'

gem 'rest-client'

group :development do
  gem 'rubocop'
end

group :test do
  gem 'minitest'
  gem 'minitest-spec-context'
  gem 'minitest-vcr'
  gem 'webmock'
  # gem 'rspec'
  gem 'capybara'
end

group :production do
  gem 'puma'
end

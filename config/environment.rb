require 'rubygems'
require 'bundler/setup'
require 'hanami/setup'
require_relative '../lib/daktel'
require_relative '../apps/bot/application'
require_relative '../apps/web/application'

Hanami::Container.configure do
  mount Bot::Application, at: '/bot'
  mount Web::Application, at: '/'
end

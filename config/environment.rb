require 'rubygems'
require 'bundler/setup'
require 'lotus/setup'
require_relative '../lib/daktel'
require_relative '../apps/bot/application'
require_relative '../apps/web/application'

Lotus::Container.configure do
  mount Bot::Application, at: '/bot'
  mount Web::Application, at: '/'
end

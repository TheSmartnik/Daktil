require 'hanami/model'
require 'hanami/mailer'
require 'pry'
Dir["#{__dir__}/daktel/**/*.rb"].each { |file| require_relative file }

Hanami::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/daktel_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/daktel_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/daktel_development'
  #    adapter type: :sql, uri: 'mysql://localhost/daktel_development'
  #
  adapter type: :sql, uri: ENV['DAKTEL_DATABASE_URL']

  ##
  # Migrations
  #
  migrations 'db/migrations'
  schema     'db/schema.sql'

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  # You can specify mapping file to load with:
  #
  #
  # Alternatively, you can use a block syntax like the following:
  #

  mapping "#{__dir__}/config/mapping"
end.load!

Hanami::Mailer.configure do
  root "#{__dir__}/daktel/mailers"

  # See http://hanamirb.org/guides/mailers/delivery
  delivery do
    development :test
    test        :test
    # production :stmp, address: ENV['SMTP_PORT'], port: 1025
  end
end.load!

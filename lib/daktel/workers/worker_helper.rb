require_relative '../../../config/environment'

require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { :namespace => 'default', :size => 1 }
end

Sidekiq.configure_server do |config|
  config.redis = { :namespace => 'default' }
end

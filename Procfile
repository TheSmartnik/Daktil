bundle exec rackup config.ru -p $PORT
bundle exec sidekiq -c 20 -r ./lib/daktel/workers/*

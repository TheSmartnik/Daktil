require 'rake'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.libs    << 'spec'
end

task default: :test
task spec: :test

namespace :verse_scheduler do
  task :start do
    require 'sidekiq'
    require_relative 'lib/daktel/workers/verse_scheduler_worker'
    VerseSchedulerWorker.new.perform
  end
end

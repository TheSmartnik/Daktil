require 'rake'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.libs << 'spec'
end

task default: :test
task spec: :test

namespace :verse_scheduler do
  task :start do
    require_relative 'config/environment'
    VerseJobsScheduler.new.perform
  end
end

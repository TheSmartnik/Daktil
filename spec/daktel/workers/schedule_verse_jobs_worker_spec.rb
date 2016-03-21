require 'spec_helper'

describe ScheduleVerseJobsWorker do
  before do
    UserRepository.create User.new(deliver_at: '7 30')
    verse = VerseRepository.create Verse.new
    ScheduledVerseRepository.create \
      ScheduledVerse.new(verse_id: verse.id, delivery_date: Date.today)
  end

  context 'verse has to be scheduled' do
    it do
      ScheduleVerseJobsWorker.new.perform
      ScheduledVerseRepository.all.count.must_equal 1
      Sidekiq::ScheduledSet.new.count.must_equal 1
    end
  end
end

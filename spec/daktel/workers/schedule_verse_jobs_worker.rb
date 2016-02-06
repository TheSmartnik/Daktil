require 'spec_helper'

describe ScheduleVerseJobsWorker do
  before do
    #TODO: Что-то с этим сделать \/
    UserRepository.clear
    ScheduledVerseRepository.clear
    VerseRepository.clear

    UserRepository.create User.new(deliver_at: '7 30')
    verse = VerseRepository.create Verse.new
    ScheduledVerseRepository.create \
      ScheduledVerse.new(verse_id: verse.id, delivery_date: Date.today)
  end

  it 'raises no errors' do
    ScheduleVerseJobsWorker.new.perform
  end

  context 'verse has to be scheduled' do
    before do
      ScheduledVerseRepository.clear
    end

    it do
      ScheduleVerseJobsWorker.new.perform
      ScheduledVerseRepository.all.count.must_equal 1
    end
  end
end

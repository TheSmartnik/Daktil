require 'spec_helper'

describe VerseSchedulerWorker do
  before do
    UserRepository.clear
    UserRepository.create User.new(deliver_at: '7 30')
    verse = Verse.new
    ScheduledVerseRepository.create \
      ScheduledVerse.new(verse_id: verse.id, delivery_date: Date.today)
  end

  it 'raises no errors' do
    VerseSchedulerWorker.new.perform
  end
end

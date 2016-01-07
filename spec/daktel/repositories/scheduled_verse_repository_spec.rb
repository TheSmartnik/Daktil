require 'spec_helper'

describe ScheduledVerseRepository do
  before { ScheduledVerseRepository.clear }

  describe 'verse_for_today' do
    let(:verse) { verse = VerseRepository.create Verse.new }
    before do
      ScheduledVerseRepository.create(
        ScheduledVerse.new verse_id: verse.id, delivery_date: Date.today)
    end

    it 'return verse for today' do
      ScheduledVerseRepository.verse_for_today.must_equal verse
    end
  end
end

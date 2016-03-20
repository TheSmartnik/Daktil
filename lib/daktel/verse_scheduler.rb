class VerseScheduler
  def self.perform
    verse = VerseRepository.not_scheduled.first

    ScheduledVerseRepository.create(
      ScheduledVerse.new verse_id: verse.id, delivery_date: Date.today)

    verse
  end
end

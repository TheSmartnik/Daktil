class VerseScheduler
  def self.perform
    verse = VerseRepository.find VerseRepository.not_scheduled.first[:id]

    ScheduledVerseRepository.create(
      ScheduledVerse.new verse_id: verse.id, delivery_date: Date.today)

    verse
  end
end

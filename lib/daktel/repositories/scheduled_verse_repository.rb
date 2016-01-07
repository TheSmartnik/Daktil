class ScheduledVerseRepository
  include Lotus::Repository

  def self.verse_for_today
    scheduled = query { where delivery_date: Date.today }.first
    VerseRepository.find scheduled.verse_id
  end
end

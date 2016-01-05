class ScheduledVerseRepository
  include Lotus::Repository

  def self.create(entity)
    entity
  end

  def self.verse_for_today
    scheduled = aquery { where date: Date.today }.first
    VerseRepository.find scheduled.verse_id
  end
end

class ScheduledVerseRepository
  include Hanami::Repository

  def self.verse_for_today
    scheduled = query { where delivery_date: Date.today }.first
    return if scheduled.blank?
    VerseRepository.find scheduled.verse_id
  end

end

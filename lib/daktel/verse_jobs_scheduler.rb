class VerseJobsScheduler

  def perform
    UserRepository.all.each do |u|
      time = Time.new *(Date.today.to_s.split('-') + u.deliver_at.split(' '))
      SendVerseWorker.perform_at time, u.chat_id, verse_id
    end
  end

  private

  def verse_id
    return @verse_id unless @verse_id.blank?
    verse = ScheduledVerseRepository.verse_for_today
    verse ||= VerseScheduler.perform
    @verse_id = verse.id
  end
end

require_relative 'worker_helper.rb'

class ScheduleVerseJobsWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { daily.hour_of_day(0).minute_of_hour(5) }

  def perform
    UserRepository.all.each do |u|
      time = Time.new(*(Date.today.to_s.split('-') + u.deliver_at.split(' ')))
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

require_relative 'worker_helper.rb'


class VerseSchedulerWorker
  include Sidekiq::Worker

  def perform
    verse = ScheduledVerseRepository.verse_for_today

    UserRepository.all.each do |u|
      now = Time.now
      t = Time.new(now.year, now.month, now.day, *u.deliver_at.split(" ")).to_i
      SendVerseWorker.perform_at t, u.chat_id, verse.id
    end
  end
end

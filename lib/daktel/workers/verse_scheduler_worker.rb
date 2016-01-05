module VerseSchedulerWorker
  def perform
    verse = VerseSchedulerWorker.verse_for_today
    User.all.each do |u|
      SendVerseWorker.perform_at u.deliver_at, u.chat_id, verse.id
    end
  end
end

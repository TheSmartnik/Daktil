require_relative 'worker_helper.rb'

class SendVerseWorker
  include Sidekiq::Worker

  def perform(chat_id, verse_id)
    verse = VerseRepository.find verse_id
    SendVerseCommand
      .new('chat_id' => chat_id, 'text' => verse.verse_with_markdown)
      .execute
  end
end

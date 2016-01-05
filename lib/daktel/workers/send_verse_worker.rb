require_relative '../telegram_commands/send_verse_command'

module SendVerseWorker
  def perform(chat_id, verse_id)
    verse = VerseRepository.find verse_id
    SendVerseCommand.new(chat_id: chat_id, text: verse.verse_with_markdown)
  end
end

require_relative 'base_command'

class SendVerseCommand < BaseCommand

  def initialize(options)
    @text = options['text']
    super
  end

  def params
    {
      chat_id: @chat_id,
      text: @text,
      parse_mode: 'markdown'
    }
  end
end

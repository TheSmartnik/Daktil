require_relative 'base_command'

class SendVerseCommand < BaseCommand

  def initialize(options)
    @text = options[:text]
  end

  def params
    {
      chat_id: @chat_id,
      text: @text
    }
  end
end

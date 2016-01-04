require_relative '../../config/command_responses.rb'

class BaseCommand

  def initialize(chat_id)
    @chat_id = chat_id
  end

  def execute
    send_response
  end

  def send_response
    RestClient.post url, params
  end

  def url
  end

  def params
    {
      chat_id: @chat_id,
      text: CommandResponses[command]
    }
  end

  def command
    self.class.to_s.downcase.gsub "command", ''
  end
end

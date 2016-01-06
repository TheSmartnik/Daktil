require 'rest-client'
require_relative '../../config/command_responses.rb'

class BaseCommand

  def initialize(options)
    @chat_id = options['chat_id']
  end

  def execute
    send_response
  end

  def send_response
    RestClient.post url, params
  end

  def url
    'example.com'
  end

  def params
    {
      chat_id: @chat_id,
      text: response_text
    }
  end

  def response_text
    CommandResponses.text command
  end

  def command
    self.class.to_s.downcase.gsub "command", ''
  end
end

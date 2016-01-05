module Bot::Controllers::TelegramResponses
  class Create
    include Bot::Action
    require 'pry'

    def call(params)
      chat_params = params['message']['chat']
      return FailCommand.new(chat_params) unless valid?
      "#{command.capitalize}Command".constantize.new(chat_params).execute
    end

    private

    def valid?
      text = params['message']['chat']['text']
      return unless text.start_with?('/')
      CommandResponses.text(command)
    end

    def command
      @command ||= params['message']['chat']['text'].slice(/[a-z]+/)
    end
  end
end

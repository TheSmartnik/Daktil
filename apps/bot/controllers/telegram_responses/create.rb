module Bot::Controllers::TelegramResponses
  class Create
    include Bot::Action

    def call(params)
      chat_params = Hash params['message']['chat']
      chat_params['chat_id'] = chat_params.delete('id')
      return FailCommand.new(chat_params) unless valid?
      "#{command.capitalize}Command".constantize.new(chat_params).execute
      status 200, "All good"
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

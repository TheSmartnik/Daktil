module Bot::Controllers::TelegramResponses
  class Create
    include Bot::Action

    def call(params)
      chat_params = Hash params['message']['chat'].merge('text' => params['message']['text'])
      chat_params['chat_id'] = chat_params.delete('id')

      execute_command(chat_params)

      status 200, "All good"
    end

    private

    def execute_command(chat_params)
      if valid?
        "#{command.capitalize}Command".constantize.new(chat_params).execute
      else
        FailCommand.new(chat_params).execute
      end
    end

    def valid?
      text = params['message']['text']
      return if command.blank?
      return unless text.start_with?('/')
      CommandResponses.text(command)
    end

    def command
      @command ||= params['message']['text'].slice(/[a-z]+/)
    end
  end
end

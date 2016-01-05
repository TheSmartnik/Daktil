module CommandResponses

  def text(command, options = {})
    responses[command.to_sym]
  end

  def responses
    {
      help:
        "Help!",
      subscribe: '',
      unsibscribe: '',
      start: '',
    }
  end

  module_function :text, :responses
end

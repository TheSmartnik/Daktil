module CommandResponses

  def text(command, options = {})
    responses(options)[command.to_sym]
  end

  def responses(options)
    {
      help:
        "- Подписаться: `/subscribe` \n"\
        "- Отписаться: `/unsubscribe`",
      subscribe:
        "Вы подписались на получение стихотворений в #{options[:delivery_time]},\n"\
        "Чтобы изменить время воспользуйтесь: `/subscribe часы минуты`",
      unsibscribe: "Вы успешно отписались (_нет_)",
      start:
        "Дактель — бот, созданный,"\
        "чтобы каждое ваше утро начиналось с приятного стихотворения.\n"\
        "Для подписки воспользуйте командой `/subscribe`",
      fail:
        "Такой команды не существует. Если вам нужно помощь — воспользуйтесь `/help`"
    }
  end

  module_function :text, :responses
end

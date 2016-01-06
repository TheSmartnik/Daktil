require_relative 'base_command'

class SubscribeCommand < BaseCommand
  DEFAULT_TIME = '9 00'

  def initialize(options)
    @user_attrs = options
    super
  end

  def execute
    return send_failure_message unless valid_format?
    persist_user
    super
  end

  private

  def persist_user
    attrs = @user_attrs.merge deliver_at: deliver_time,
      origin: "telegram:#{@user_attrs['type']}"

    UserRepository.persist update_or_initialize_user(attrs)
  end

  def update_or_initialize_user(attrs)

    user = UserRepository.find_by_chat_id @chat_id
    return User.new(attrs) if user.blank?
    user.update(attrs)
    user
  end

  def deliver_time
    time = @user_attrs['text'].gsub /\/subscribe\s?/, ''
    time.blank? ? DEFAULT_TIME : time
  end

  def valid_format?
    @user_attrs['text'][/\/subscribe((\s\d{1,2}){2}|)\z/]
  end

  def send_failure_message
    FailCommand.new(@user_attrs, reason: :wrong_format).execute
  end

  def response_text
    CommandResponses.text command, deliver_time: deliver_time
  end
end

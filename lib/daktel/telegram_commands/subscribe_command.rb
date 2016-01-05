require_relative 'base_command'

class SubscribeCommand < BaseCommand
  DEFAULT_TIME = '9 00'

  def initialize(options)
    @user_attrs = options
    super
  end

  def execute
    return send_failure_message unless valid_format?
    create_user
    super
  end

  def create_user
    UserRepository.create(User.new @user_attrs.merge deliver_at: deliver_time)
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

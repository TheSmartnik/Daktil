require_relative 'base_command'

class SubscribeCommand < BaseCommand
  DEFAULT_TIME = '9 00'.freeze

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
    attrs = @user_attrs.merge deliver_at: delivery_time,
      origin: "telegram:#{@user_attrs['type']}"

    UserRepository.persist update_or_initialize_user(attrs)
  end

  def update_or_initialize_user(attrs)
    user = UserRepository.find_by_chat_id @chat_id
    return User.new(attrs) if user.blank?
    user.update(attrs)
    user
  end

  def delivery_time
    time = @user_attrs['text'].gsub(/\/subscribe\s?/, '')
    time.blank? ? DEFAULT_TIME : time
  end

  def valid_format?
    @user_attrs['text'][/\/subscribe((\s\d{1,2}){2}|)\z/] && delivery_time_in_range?
  end

  def delivery_time_in_range?
    hours, minutes = delivery_time.split(' ')
    (0..24).cover?(Integer hours) && (0..60).cover?(Integer minutes)
  end

  def send_failure_message
    FailCommand.new(@user_attrs).execute
  end

  def response_text
    CommandResponses.text command, delivery_time: delivery_time
  end
end

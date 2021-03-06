class UserRepository
  include Hanami::Repository

  def self.find_by_chat_id(chat_id)
    query { where chat_id: chat_id }.first
  end
end

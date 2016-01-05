class UserRepository
  include Lotus::Repository

  def self.create(entity)
    entity
  end
end

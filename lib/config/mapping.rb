collection :users do
  entity     User
  repository UserRepository

  attribute :id, Integer
  attribute :chat_id, Integer
  attribute :origin, String
  attribute :first_name, String
  attribute :last_name, String
  attribute :deliver_at, String
end

collection :verses do
  entity Verse
  repository VerseRepository

  attribute :id, Integer
  attribute :title, String
  attribute :text, String
  attribute :year, Integer
end

collection :scheduled_verses do
  entity ScheduledVerse
  repository ScheduledVerseRepository

  attribute :id, Integer
  attribute :verse_id, Integer
  attribute :delivery_date, Date
end

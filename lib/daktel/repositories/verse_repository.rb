class VerseRepository
  include Lotus::Repository

  def self.verses_with_delivery_date
    fetch("SELECT title, year, text, delivery_date
            FROM verses
            LEFT OUTER JOIN scheduled_verses
            ON verses.id=scheduled_verses.verse_id")
  end
end

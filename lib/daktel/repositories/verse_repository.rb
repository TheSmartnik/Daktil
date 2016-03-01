class VerseRepository
  include Lotus::Repository
  # TODO:Разобраться с джоинами, а то хуйня какая-то

  def self.verses_with_delivery_date
    fetch("SELECT DISTINCT ON (verses.id) verses.id, title, year, text, delivery_date
            FROM verses
            LEFT OUTER JOIN scheduled_verses
            ON verses.id=scheduled_verses.verse_id")
  end

  def self.not_scheduled
    fetch("SELECT verses.id
            FROM verses
            LEFT OUTER JOIN scheduled_verses
            ON verses.id=scheduled_verses.verse_id
            WHERE delivery_date IS NULL
            ORDER BY verses.id ASC")
  end
end

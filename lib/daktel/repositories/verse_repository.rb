class VerseRepository
  include Hanami::Repository

  def self.verses_with_delivery_date
    sql = "SELECT DISTINCT ON (verses.id) verses.id, title, year, text, delivery_date
          FROM verses
          LEFT OUTER JOIN scheduled_verses
          ON verses.id=scheduled_verses.verse_id
          ORDER BY verses.id ASC"

    fetch(sql).map { |attrs| OpenStruct.new(attrs) }
  end

  def self.not_scheduled
    query do
      left_join(:scheduled_verses, foreign_key: :id, primary_key: :verse_id)
        .where(delivery_date: nil)
        .order('verses.id' => 'asc' )
    end
  end
end

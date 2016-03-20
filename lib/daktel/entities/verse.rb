class Verse
  include Hanami::Entity
  attributes :title, :text, :year

  def verse_with_markdown
    "#{title}\n"\
    "\n"\
    "#{text}\n"
  end
end

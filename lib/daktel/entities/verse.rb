class Verse
  include Lotus::Entity
  attributes :title, :text, :year

  def verse_with_markdown
    <<-EOF
    #{title}

    #{text}
    EOF
  end
end

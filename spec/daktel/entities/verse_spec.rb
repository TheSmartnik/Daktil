require 'spec_helper'

describe Verse do
  it 'can can be intialised with attributes' do
    attrs = { title: 'Тучи', year: 1889, text: '' }
    verse = Verse.new attrs
    attrs.keys.each do |k|
      verse.send(k).must_equal attrs[k]
    end
  end

  it 'returns in the right format' do
    verse = Verse.new(title: 'Тучи', text: 'Тучки небесные')

    verse.verse_with_markdown.must_equal(
<<-EOF
Тучи

Тучки небесные
EOF
)
  end
end

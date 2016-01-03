require 'spec_helper'

describe VerseRepository do
  it 'saves with correct attributes' do
    attrs = { title: 'title', year: 1889, text: '' }
    verse = VerseRepository.create Verse.new(attrs)
    verse.to_h.tap { |h| h.delete :id }.must_equal attrs
  end
end

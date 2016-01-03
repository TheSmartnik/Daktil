require 'spec_helper'

describe Verse do
  it 'can can be intialised with attributes' do
    verse = Verse.new title: 'Тучи'
    verse.title.must_equal 'Тучи'
  end
end

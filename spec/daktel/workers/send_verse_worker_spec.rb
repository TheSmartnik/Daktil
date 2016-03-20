require 'spec_helper'

describe SendVerseWorker do
  let(:verse) { VerseRepository.create Verse.new(text: 'text') }
  before { VCR.insert_cassette name }

  it 'aint raising errors' do
    SendVerseWorker.new.perform(1, verse.id)
  end
end

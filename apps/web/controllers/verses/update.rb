module Web::Controllers::Verses
  class Update
    include Web::Action

    def call(_params)
      @verse = VerseRepository.persist Verse.new(verse_params)
      redirect_to "/verses/edit/#{@verse.id}"
    end

    private

    def verse_params
      attrs = Hash params[:verse]
      attrs['id'].blank? ? attrs.merge('id' => nil) : attrs
    end
  end
end

module Web::Controllers::Verses
  class Update
    include Web::Action

    def call(params)
      @verse = VerseRepository.persist Verse.new(params[:verse])
      redirect_to "/verses/edit/#{@verse.id}"
    end

  end
end

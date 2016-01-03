module Web::Controllers::Verses
  class Create
    include Web::Action

    def call(params)
      VerseRepository.create Verse.new(params[:verse])
      redirect_to '/'
    end
  end
end

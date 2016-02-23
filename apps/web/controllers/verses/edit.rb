module Web::Controllers::Verses
  class Edit
    include Web::Action
    expose :verse

    def call(params)
      @verse = VerseRepository.find(params[:id])
    end
  end
end

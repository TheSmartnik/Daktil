module Web::Controllers::Verses
  class Index
    include Web::Action
    expose :verses
    def call(_params)
      @verses = VerseRepository.verses_with_delivery_date
    end
  end
end

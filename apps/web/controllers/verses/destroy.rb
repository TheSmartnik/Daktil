module Web::Controllers::Verses
  class Destroy
    include Web::Action
    expose :verse

    def call(params)
      VerseRepository.delete VerseRepository.find(params["verse"]["id"])
      redirect_to "/verses"
    end
  end
end

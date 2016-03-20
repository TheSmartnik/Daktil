module Web::Controllers::Verses
  class New
    include Web::Action
    expose :verse

    def call(_params)
      @verse = Verse.new
    end
  end
end

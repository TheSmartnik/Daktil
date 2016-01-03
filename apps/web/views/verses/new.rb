module Web::Views::Verses
  class New
    include Web::View
    include Lotus::Helpers

    def form_for_a_verse
      form_for :verse, '/verses' do
        div class: 'input' do
          label :title
          text_field :title
        end

        div class: 'input' do
          label :text
          text_area :text
        end

        div class: 'controls' do
          submit 'Create Verse'
        end
      end
    end
  end
end

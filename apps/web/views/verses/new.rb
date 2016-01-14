module Web::Views::Verses
  class New
    include Web::View
    include Lotus::Helpers

    def form_for_a_verse
      form_for :verse, '/verses', class: 'forms' do
        fieldset do
          legend 'Add verse'

          section  do
            label :title
            text_field :title
          end

          section do
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
end

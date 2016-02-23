module Web::Forms
  module Verse
    include Lotus::Helpers

    def form_for_a_verse
      form_for :verse, '/verses', method: :patch, class: 'forms' do
        fieldset do
          legend 'Add verse'

          section do
            hidden_field :id, value: verse.id
          end

          section  do
            label :title
            text_field :title, value: verse.title
          end

          section do
            label :text
            text_area :text, verse.text
          end

          div class: 'controls' do
            submit 'update/create verse'
          end
        end
      end
    end

    def form_to_delete
      form_for :verse, '/verses', method: :delete do
        hidden_field :id, value: verse.id

        div class: 'controls' do
          submit 'Destruction'
        end
      end
    end
  end

end

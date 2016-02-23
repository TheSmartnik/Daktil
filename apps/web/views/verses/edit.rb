module Web::Views::Verses
  require_relative '../../forms/verse'

  class Edit
    include Web::View
    include Web::Forms::Verse
  end
end

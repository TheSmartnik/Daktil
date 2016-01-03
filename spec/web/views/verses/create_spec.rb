require 'spec_helper'
require_relative '../../../../apps/web/views/verses/create'

describe Web::Views::Verses::Create do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/verses/create.html.erb') }
  let(:view)      { Web::Views::Verses::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end

require 'spec_helper'
require_relative '../../../../apps/web/views/verses/new'

describe Web::Views::Verses::New do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/verses/new.html.erb') }
  let(:view)      { Web::Views::Verses::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end

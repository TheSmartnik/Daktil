require 'spec_helper'
require_relative '../../../../apps/web/controllers/verses/create'

describe Web::Controllers::Verses::Create do
  let(:action) { Web::Controllers::Verses::Create.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end

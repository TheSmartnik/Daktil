require 'spec_helper'
require_relative '../../../../apps/web/controllers/verses/new'

describe Web::Controllers::Verses::New do
  let(:action) { Web::Controllers::Verses::New.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end

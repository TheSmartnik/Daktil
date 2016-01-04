require 'spec_helper'
require_relative '../../../../apps/bot/controllers/telegram_responses/create'

describe Bot::Controllers::TelegramResponses::Create do
  let(:action) { Bot::Controllers::TelegramResponses::Create.new }
  describe 'commands' do
    context 'message via direct message' do
      let(:params) {
        {
          message: {
            from: {
              first_name: "Nikita",
              last_name: "Misharin"
            },
            chat: {
              first_name: "Nikita",
              last_name: "Misharin",
              type: "private"
            }
          }
        }
      }

      context '/help' do
        before do
          params[:chat].merge! text: "/help"
        end

        it "is successful" do
          response = action.call(params)
          response[0].must_equal 200
        end
      end

      context '/start' do
      end

      context '/subscribe' do
      end

      context '/unsubscribe' do
      end
    end
  end
end

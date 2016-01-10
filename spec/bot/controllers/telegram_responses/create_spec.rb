require 'spec_helper'
require_relative '../../../../apps/bot/controllers/telegram_responses/create'

describe Bot::Controllers::TelegramResponses::Create do
  let(:action) { Bot::Controllers::TelegramResponses::Create.new }
  describe 'commands', :vcr do
    context 'message via direct message' do
      let(:params) {
        {
          message: {
            from: {
              first_name: 'Nikita',
              last_name: 'Misharin'
            },
            chat: {
              id: '1',
              first_name: 'Nikita',
              last_name: 'Misharin',
              type: 'private'
            }
          }
        }
      }

      context '/subscribe' do
        before do
          VCR.insert_cassette name
          UserRepository.clear

          params[:message].merge! text: '/subscribe'
        end

        it "is successful" do
          response = action.call(params)
          response[0].must_equal 200
        end

        it 'creates user with params' do
          action.call(params)
          UserRepository.all.count.must_equal 1
        end

        context 'when user updates delivery time' do
          before do
            UserRepository.create User.new(chat_id: 1, deliver_at: '9 00')
            params[:message].merge! text: '/subscribe 7 30'
          end

          it 'update delivery time' do
            action.call(params)
            UserRepository.all.count.must_equal 1
            UserRepository.first.deliver_at.must_equal '7 30'
          end
        end
      end

      context '/start' do
        before { params[:message].merge! text: '/start' }
        it { action.call(params) }
      end

      context '/help' do
        before { params[:message].merge! text: '/help' }
        it { action.call(params) }
      end

      context '/unsubscribe' do
        before { params[:message].merge! text: '/unsubscribe' }
        it { action.call(params) }
      end
    end
  end
end

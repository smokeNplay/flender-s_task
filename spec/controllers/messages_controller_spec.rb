require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  describe '#create', type: :request do
    let(:proper_message) do
      {
        email: 'example@test.com',
        first_name: 'John',
        last_name: 'Snow',
        amount: 1000
      }
    end

    it 'should create a new Message with proper params' do
      messages_count = Message.count
      post '/messages', params: { message: proper_message }

      expect(Message.count).to eq messages_count + 1
      expect(response).to have_http_status(:created)
    end

    it 'should not create any Messages without proper params' do
      messages_count = Message.count
      post '/messages', params: { foo: :bar }

      expect(Message.count).to eq messages_count
      expect(response).to have_http_status(:bad_request)
    end
  end
end

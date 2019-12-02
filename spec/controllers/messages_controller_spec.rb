require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:chat_room) { ChatRoom.create(name: 'test') }
  let(:params) do
    {
      chat_room_id: chat_room.id,
      message: { message: 'This is a message' }
    }
  end
  let!(:user) { User.create(name: 'z') }

  describe 'POST#create' do
    let(:call) { post(:create, params: params) }

    it 'creates a new Message' do
      expect { call }.to change { Message.count }.by(1)
    end
  end
end

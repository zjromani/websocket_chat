require 'rails_helper'

RSpec.describe ChatRoomUsersController, type: :controller do
  let(:chat_room) { ChatRoom.create(name: 'test') }
  let(:params) { { chat_room_id: chat_room.id } }
  let!(:user) { User.create(name: 'z') }

  describe 'POST#create' do
    let(:call) { post(:create, params: params) }

    it 'creates a new ChatRoomUser' do
      expect { call }.to change { ChatRoomUser.count }.by(1)
    end
  end

  describe 'DELETE#destroy' do
    let(:call) { delete(:destroy, params: params) }
    before { ChatRoomUser.create(chat_room: chat_room, user: user) }
    it 'destroys ChatRoomUser' do
      expect { call }.to change { ChatRoomUser.count }.by(-1)
    end
  end
end

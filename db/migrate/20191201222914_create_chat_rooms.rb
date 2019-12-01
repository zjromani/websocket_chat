class CreateChatRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :chat_rooms do |t|
      t.string :name

      t.timestamps
    end
    add_index :chat_rooms, :name, unique: true
  end
end

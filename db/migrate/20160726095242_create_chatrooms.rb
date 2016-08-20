class CreateChatrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :chatrooms do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end

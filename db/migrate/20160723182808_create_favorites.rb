class CreateFavorites < ActiveRecord::Migration[5.0]
  def up
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :favorites
  end
end

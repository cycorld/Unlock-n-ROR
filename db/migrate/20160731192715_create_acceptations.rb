class CreateAcceptations < ActiveRecord::Migration[5.0]
  def change
    create_table :acceptations do |t|
      t.references :question, foreign_key: true
      t.references :answer, foreign_key: true

      t.timestamps
    end
  end
end

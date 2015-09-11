class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :question, null: false, unique: true
      t.string :answer, null: false
      t.integer :deck_id

      t.timestamps
    end
  end
end

class AddCardIdToGuesses < ActiveRecord::Migration
  def change
    add_column :guesses, :game_id, :integer
    remove_column :guesses, :user_id, :integer
  end
end

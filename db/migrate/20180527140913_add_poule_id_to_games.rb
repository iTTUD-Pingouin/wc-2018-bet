class AddPouleIdToGames < ActiveRecord::Migration[5.2]
  def change
    add_reference :games, :poule, foreign_key: true
  end
end

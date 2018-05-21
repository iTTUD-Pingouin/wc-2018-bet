class AddPouleToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :poule, :string
  end
end

class AddEndToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :end, :boolean, null: false, default: false
  end
end

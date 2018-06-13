class AddMatchHourToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :hour, :integer
  end
end

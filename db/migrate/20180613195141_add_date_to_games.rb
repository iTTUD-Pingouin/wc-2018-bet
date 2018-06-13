class AddDateToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :date, :time
  end
end

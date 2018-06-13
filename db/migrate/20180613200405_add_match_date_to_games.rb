class AddMatchDateToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :date, :integer
  end
end

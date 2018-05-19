class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :gameref
      t.string :team1
      t.string :team2
      t.integer :score1
      t.integer :score2

      t.timestamps
    end
  end
end

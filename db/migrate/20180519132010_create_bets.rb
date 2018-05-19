class CreateBets < ActiveRecord::Migration[5.2]
  def change
    create_table :bets do |t|
      t.integer :score1bet
      t.integer :score2bet
      t.references :game, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

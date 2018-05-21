class AddDomFlagToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :domflag, :string
    add_column :games, :extflag, :string
  end
end

class Game < ApplicationRecord
  has_many :bets
  has_many :users, through: :bets

  validates :team1, presence: true
  validates :team2, presence: true
end

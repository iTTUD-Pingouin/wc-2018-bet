class Bet < ApplicationRecord
  belongs_to :game
  belongs_to :user

  validates :score1bet, presence: true
  validates :score2bet, presence: true
  validates :user_id, presence: true, uniqueness: { scope: :game_id }
end

class Game < ApplicationRecord
  has_many :bets, dependent: :destroy
  has_many :users, through: :bets
  belongs_to :poule


  include PgSearch
  pg_search_scope :search_by_teams_and_poule,
    against: [ :team1, :team2, :poule ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  validates :team1, presence: true
  validates :team2, presence: true
end

class User < ApplicationRecord
  has_many :bets, dependent: :destroy
  has_many :games, through: :bets
  belongs_to :group

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

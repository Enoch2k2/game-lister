class Game < ApplicationRecord
  has_many :user_games
  has_many :users, through: :user_games
  has_many :items

  validates :name, presence: true, uniqueness: true

  def self.alphabetized
    order(name: :desc)
  end
end

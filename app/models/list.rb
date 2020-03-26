class List < ApplicationRecord
  belongs_to :user_game
  has_many :list_items
  has_many :lists, through: :list_items

  validates_presence_of :name
end

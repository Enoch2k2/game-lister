class Item < ApplicationRecord
  belongs_to :game
  has_many :list_items
  has_many :lists, through: :list_items

  validates :name, presence: true
end

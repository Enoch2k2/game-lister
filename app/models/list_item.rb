class ListItem < ApplicationRecord
  belongs_to :list
  belongs_to :item

  validates_presence_of :quantity

  accepts_nested_attributes_for :item, reject_if: proc { |attributes| attributes['name'].blank? }
end

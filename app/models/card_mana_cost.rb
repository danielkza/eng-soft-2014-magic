class CardManaCost < ActiveRecord::Base
  belongs_to :card
  belongs_to :color

  validates :card, presence: true
  validates :amount, numericality: { only_integer: true, greater_than: 0 }
  validates :color, uniqueness: { scope: :card }
end

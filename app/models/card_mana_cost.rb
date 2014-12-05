class CardManaCost < ActiveRecord::Base
  belongs_to :card
  belongs_to :color

  validates :card, presence: true
  validates :amount, numericality: { only_integer: true, greater_than: 0 },
            allow_nil: true
  validates :color, uniqueness: { scope: :card }
  validate do
    if ! color and amount.nil?
      errors.add(:color, 'Either color or amount must be set')
      errors.add(:amount, 'Either color or amount must be set')
    end
  end
end

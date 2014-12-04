class Card < ActiveRecord::Base
  belongs_to :color
  has_many :mana_costs, class_name: 'CardManaCost', autosave: true,
           dependent: :destroy
  has_many :mana_colors, source: :color, through: :mana_costs

  has_and_belongs_to_many :card_types, uniq: true, autosave: true,
                          dependent: :destroy

  validates :name, length: { minimum: 2 }, uniqueness: { case_sensitive: false }
  validates :number, presence: true, uniqueness: { case_sensitive: false }

  validates :power, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0},
            allow_nil: true
  validates :toughness, numericality: { only_integer: true,
                                        greater_than_or_equal_to: 0},
            allow_nil: true
  validates :image, presence: true

  validates :card_types, presence: true

  before_save :fix_color

  def add_mana_cost(color, amount)
    color = Color.where('lower(name) = ?', color.to_s).first!
    self.mana_costs.build(color: color, amount: amount)
    self
  end

  def add_type(type)
    type = CardType.where('lower(name) = ?', type.to_s).first!
    self.card_types << type
    self
  end

  def colors
    [*self.color, *mana_colors].uniq
  end

  def color_syms
    colors.map(&:to_sym)
  end

  protected

  def fix_color
    if color.nil? and ! mana_costs.empty?
      self.color = mana_costs[0].color
    end
  end
end

class Card < ActiveRecord::Base
  has_many :mana_costs, class_name: 'CardManaCost', autosave: true,
           dependent: :destroy
  has_many :colors, through: :mana_costs

  has_and_belongs_to_many :super_types, class_name: 'CardSuperType', uniq: true,
                          autosave: true
  has_and_belongs_to_many :types, class_name: 'CardType', uniq: true,
                          autosave: true
  has_and_belongs_to_many :sub_types, class_name: 'CardSubType', uniq: true,
                          autosave: true

  has_many :decks

  validates :name, length: { minimum: 2 }, uniqueness: { case_sensitive: false }
  validates :number, presence: true, uniqueness: { case_sensitive: false }

  validates :power, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0},
            allow_nil: true
  validates :toughness, numericality: { only_integer: true,
                                        greater_than_or_equal_to: 0 },
            allow_nil: true

  validates :types, presence: true
  validate :validate_colors
  validate :validate_power_toughness


  def add_mana_cost(color_sym, amount)
    color = color_sym && Color.find_by_sym!(color_sym)
    self.mana_costs.build(color: color, amount: amount)
    self
  end

  def add_land_color(color_sym)
    color = Color.find_by_sym!(color_sym)
    self.mana_costs.build(color: color)
    self
  end

  def add_super_type(type_sym)
    self.super_types << CardSuperType.find_by_sym!(type_sym)
    self
  end

  def add_type(type_sym)
    self.types << CardType.find_by_sym!(type_sym)
    self
  end

  def add_sub_type(type_sym)
    self.sub_types << CardSubType.find_by_sym!(type_sym)
    self
  end

  protected

  def validate_colors
    if types.map(&:to_sym).include?(:land)
      if mana_costs.any?(&:amount)
        errors.add(:mana_costs, 'Lands cannot have non-nil mana costs')
      end
    elsif ! mana_costs.all?(&:amount)
      errors.add(:mana_costs, 'Only Lands can have nil mana costs')
    end
  end

  def validate_power_toughness
    is_creature = types.map(&:to_sym).include?(:creature)

    unless is_creature or power.nil?
      errors.add(:power, 'Must not have power unless creature')
    end

    unless is_creature or toughness.nil?
      errors.add(:toughness, 'Must not have toughness unless creature')
    end
  end
end

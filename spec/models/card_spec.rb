require 'rails_helper'

RSpec.describe Card, :type => :model do
  before do
    @creature = create(:blue_basic_human_creature)
    @land = create(:blue_land)
    @enchantment = create(:blue_green_legendary_enchantment)
  end

  describe 'land' do
    it 'has no mana costs' do
      expect(@land.mana_costs).to all satisfy { |c| c.amount.nil? }
    end

    it 'has the correct color' do
      expect(@land.colors).not_to be_empty
    end

    it 'not to have power or toughness' do
      expect(build(:blue_land, power: 1).valid?).to be false
      expect(build(:blue_land, toughness: 1).valid?).to be false
    end
  end

  describe 'creature' do
    it 'has only valid mana costs' do
      expect(@creature.mana_costs).to all satisfy { |c| ! c.amount.nil? }
    end

    it 'has a color corresponding to the mana cost' do
      expect(@creature.colors).not_to be_empty
    end
  end
end

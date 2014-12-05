require 'rails_helper'

RSpec.describe CardSuperType, :type => :model do
  before do
    @legendary_type = CardSuperType.find_by_name('Legendary')
  end

  it 'has a correct symbol' do
    expect(@legendary_type.to_sym).to eq(:legendary)
  end

  it 'is unique' do
    expect(CardSuperType.create(name: 'legendary').errors).to include(:name)
  end

  it 'has corresponding cards' do
    enchantment = create(:blue_green_legendary_enchantment)
    expect(@legendary_type.cards).to include(enchantment)
  end
end

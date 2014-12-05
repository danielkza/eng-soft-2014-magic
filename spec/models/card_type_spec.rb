require 'rails_helper'

RSpec.describe CardType, :type => :model do
  before do
    @creature_type = CardType.find_by_name('Creature')
  end

  it 'has a correct symbol' do
    expect(@creature_type.to_sym).to eq(:creature)
  end


  it 'is unique' do
    expect(CardType.create(name: 'creature').errors).to include(:name)
  end

  it 'has corresponding cards' do
    creature = create(:blue_basic_human_creature)
    expect(@creature_type.cards).to include(creature)
  end
end

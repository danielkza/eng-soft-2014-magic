require 'rails_helper'

RSpec.describe CardSubType, :type => :model do
  before do
    @human_sub_type = CardSubType.find_by_name('Human')
  end

  it 'has a correct symbol' do
    expect(@human_sub_type.to_sym).to eq(:human)
  end

  it 'is unique' do
    expect(CardSubType.create(name: 'human').errors).to include(:name)
  end

  it 'has corresponding cards' do
    creature = create(:blue_basic_human_creature)
    expect(@human_sub_type.cards).to include(creature)
  end
end

require 'rails_helper'
RSpec.describe MortalityHandler, type: :service do
  let(:admin) { create(:user, level: 2) }
  let(:house1) { create(:house, user: admin) }
  let(:house2) { create(:house, user: admin) }

  describe "#initialize" do
    it 'takes two key word arguments' do
      mh = MortalityHandler.new(house_id: house1.id, deaths: 5)

      expect([mh.house_id, mh.deaths]).to eql [house1.id, 5]
    end
  end

  describe "#remove_dead_birds" do
    it 'returns true if dead bird successfully removed' do
      mh = MortalityHandler.new(house_id: house1.id, deaths: 5)
      expect(mh.remove_dead_birds!).to eql true
    end

    it 'returns true if dead bird successfully removed' do
      mh = MortalityHandler.new(house_id: -1, deaths: 5)
      expect(mh.remove_dead_birds!).to eql false
    end
  end

  describe "#total_death_count" do
    it 'reflects all dead birds removed' do
      mh2 = MortalityHandler.new(house_id: house2.id, deaths: 9)

      mh2.remove_dead_birds!
      expect(MortalityHandler.total_death_count).to eql 14
    end
  end
end

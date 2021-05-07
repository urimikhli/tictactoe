# frozen_string_literal: true

require 'rails_helper'

# Test suite for the Item model
RSpec.describe Player, type: :model do
  before { @player = FactoryBot.build(:player) }

  subject { @player }
  it { should respond_to(:name) }
  it { should respond_to(:wins) }
  it { should respond_to(:losses) }
  it { should respond_to(:draws) }
  it { should be_valid }

  describe 'test no name' do
    it 'has no name' do
      FactoryBot.build(:player, name: nil).should_not be_valid
    end
  end

  describe 'Player.calculate_winloss' do
    it 'should return the winloss ratio' do
      player = FactoryBot.build(:player, wins:33 , losses:34, draws: 33)
      expect(Player.calculate_winloss(player)).to eq(49.5)
    end
  end
end

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
  it { should respond_to(:winloss) }
  it { should be_valid }

  describe 'test no name' do
    it 'has no name' do
      FactoryBot.build(:player, name: nil).should_not be_valid
    end
  end

  describe '#winloss' do
    context '  winloss  is calculated when player is created ' do
      before do
        @player.save
        @player.reload
      end
      it 'should return winloss when player is created' do
        expect(@player.winloss).not_to be_nil
      end
      it 'should be an accurate winloss ratio' do
        winloss =  ( @player.wins + ( @player.draws * 0.5 ) / (@player.wins + @player.losses + @player.draws) )
        expect(@player.winloss).to eq(winloss)

      end
    end
  end
end

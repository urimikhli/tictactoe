require 'rails_helper'

RSpec.describe "/players", type: :request do
    let(:player) { FactoryBot.create(:player, wins:33 , losses:34, draws: 33) }
    let(:player2) { FactoryBot.create(:player, wins:10 , losses:10, draws: 10) }
    before do
        player
        player2
    end
    describe "GET /index" do
        context 'add winloss to rendered json' do
            it 'should add a winloss field to each player rendered in players list ' do
                get '/api/v1/players'
                expect(json_data[0][:winloss]).to be(49.5)
                expect(json_data[1][:winloss]).to be(50.0)
            end
        end
    end
end
require 'rails_helper'

RSpec.describe "/players", type: :request do
    let(:player) { FactoryBot.create(:player, wins:33 , losses:34, draws: 33) }
    let(:player2) { FactoryBot.create(:player, wins:10 , losses:10, draws: 10) }
    before do
        player
        player2
    end
    describe "GET /index" do
        it 'should add a winloss field to each player rendered in players list ' do
            get '/api/v1/players'
            expect(json_data[0][:winloss]).to be(49.5)
            expect(json_data[1][:winloss]).to be(50.0)
        end
    end
    describe "GET /show" do
        it 'should add winloss to rendered player ' do
            get '/api/v1/players/1'
            pp json
            expect(json['winloss']).to be(49.5)
        end
    end

    describe "POST /players" do
        it 'should render winloss attribute when creating a player' do
            player_attributes = FactoryBot.build(:player, wins:33 , losses:34, draws: 33).attributes
            pp player_attributes
            post '/api/v1/players/', params: {player: player_attributes}
            expect(json['winloss']).to be(49.5)
        end
    end

    describe "PUT /players/:id" do
    end
end
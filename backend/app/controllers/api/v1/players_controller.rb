# frozen_string_literal: true

class Api::V1::PlayersController < ApplicationController
  before_action :set_player, only: %i[show update destroy]
  # GET /players
  def index
    players = Player.all
    @players = []

    players.map do |player|
      @players.push player.attributes.to_hash.merge(winloss: calculate_winloss(player))
    end
    render json: @players.to_json
  end

  # GET /players/1
  def show
      
    render json: player_with_winloss
  end

  # POST /players
  def create
    @player = Player.new(player_params)


    if @player.save
      render json: player_with_winloss, status: :created, location: api_v1_player_url(@player)
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /players/1
  def update
      if @player.update(player_params)
        render json: player_with_winloss, status: :accepted, location: api_v1_player_url(@player)
      else
        render json: @player.errors, status: :unprocessable_entity
      end
  end

  # DELETE /players/1
  def destroy
    @player.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_player
    @player = Player.find(params[:id])
  end

  def calculate_winloss(player)
    Player.calculate_winloss(player)
  end

  def player_with_winloss
    @player.attributes.to_hash.merge(winloss: calculate_winloss(@player)).to_json
  end


  # Only allow a trusted parameter "white list" through.
  def player_params
    params.require(:player).permit(:name, :result, :wins, :losses, :draws)
  end
end

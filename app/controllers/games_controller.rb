class GamesController < ApplicationController
  before_action :find_game_by_id, only: [:show, :edit, :update, :destroy]

  def index
    @games = Game.all.sort
  end

  def show
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to games_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @game.update(game_params)
      redirect_to game_path(@game)
    else
      render :edit
    end
  end

  def destroy
    @game.destroy
    redirect_to games_path
  end

  private

  def game_params
    params.require(:game).permit(:team1, :team2, :score1, :score2)
  end

  def find_game_by_id
    @game = Game.find(params[:id])
  end
end

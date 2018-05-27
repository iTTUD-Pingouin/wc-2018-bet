class GamesController < ApplicationController
  before_action :find_game_by_id, only: [:show, :edit, :update, :destroy]


  def index
    @poules = Poule.all
    @games = policy_scope(Game)
    @games_A = Game.select { |game| game.poule == "A"}
    @games_B = Game.select { |game| game.poule == "B"}
    @games_C = Game.select { |game| game.poule == "C"}
    @games_D = Game.select { |game| game.poule == "D"}
    @games_E = Game.select { |game| game.poule == "E"}
    @games_F = Game.select { |game| game.poule == "F"}
    @games_G = Game.select { |game| game.poule == "G"}
    @games_H = Game.select { |game| game.poule == "H"}
  end

  def show
  end

  def new
    @poules = Poule.all
    @game = Game.new
    authorize @game
  end

  def create
    @game = Game.new(game_params)
    authorize @game
    if @game.save
      redirect_to games_path
    else
      render :new
    end
  end

  def edit
    @poules = Poule.all
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

  def my_group
    @games = Game.all
    authorize @games
  end

  def global_ranking
    @games = Game.all
    authorize @games
  end

  private

  def game_params
    params.require(:game).permit(:team1, :team2, :score1, :score2, :poule, :domflag, :extflag, :poule_id)
  end

  def find_game_by_id
    @game = Game.find(params[:id])
    authorize @game
  end
end

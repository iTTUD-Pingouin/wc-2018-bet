class GamesController < ApplicationController
  before_action :find_game_by_id, only: [:show, :edit, :update, :destroy]

  def index
    @teams = ['Arabie Saoudite', 'Argentine', 'Australie', 'Belgique', 'Brésil', 'Colombie', 'Costa Rica', 'Croatie', 'Danemark', 'Egypte', 'Angleterre', 'France', 'Allemagne', 'Islande', 'Iran', 'Japon', 'Mexique', 'Maroc', 'Nigéria', 'Panama', 'Pérou', 'Pologne', 'Portugal', 'Russie', 'Sénégal', 'Serbie', 'Corée du Sud', 'Espagne', 'Suisse', 'Suède', 'Tunisie', 'Uruguay'].sort.unshift(' ')
    @poules = Poule.all
    @games = policy_scope(Game)
  end

  def show
    @bet = Bet.new

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

  def nogroup
    @games = Game.all
    authorize @games
  end

  def next_games
    @games = Game.all
    @bet = Bet.new
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

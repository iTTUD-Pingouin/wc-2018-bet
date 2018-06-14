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
    @users = User.all
    authorize @games
  end

  def global_ranking
    @games = Game.all

    @games.each do |game|
        # victoire de l'équipe à domicile -------------------
      if game.score1 != nil && game.score2 != nil && game.score1 > game.score2 && game.end == true

        game.bets.each do |bet|
          if bet.score1bet > bet.score2bet && bet.score1bet == game.score1 && bet.score2bet == game.score2
            bet.user.points += 3
            bet.user.save!


          elsif bet.score1bet > bet.score2bet && (bet.score1bet != game.score1 || bet.score2bet != game.score2)
            bet.user.points += 2
            bet.user.save!

          else

          end
        end



        # victoire de l'équipe à l'extérieur -------------------
      elsif game.score1 != nil && game.score2 != nil && game.score1 < game.score2 && game.end == true

        game.bets.each do |bet|
          if bet.score1bet < bet.score2bet && bet.score1bet == game.score1 && bet.score2bet == game.score2
            bet.user.points += 3
            bet.user.save!

          elsif bet.score1bet < bet.score2bet && (bet.score1bet != game.score1 || bet.score2bet != game.score2)
            bet.user.points += 2
            bet.user.save!
          else

          end
        end


        # match nuls -------------------
      elsif game.score1 != nil && game.score2 != nil && game.score1 == game.score2 && game.end == true

        game.bets.each do |bet|
          if bet.score1bet == bet.score2bet && bet.score1bet == game.score1 && bet.score2bet == game.score2
            bet.user.points += 3
            bet.user.save!

          elsif bet.score1bet == bet.score2bet && (bet.score1bet != game.score1 || bet.score2bet != game.score2)
            bet.user.points += 2
            bet.user.save!

          else

          end
        end
      end

    game.end = false
    game.save!
    end

    @users = User.all


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

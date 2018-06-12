class BetsController < ApplicationController

  before_action :set_bet, only: [:edit, :update, :destroy]

  # def new
  #   @game = Game.find(params[:game_id])
  #   @bet = Bet.new
  #   authorize @bet
  # end

  def create
    @game = Game.find(params[:game_id])
    @bet = Bet.new(bet_params)
    @bet.game = @game
    @bet.user = current_user
    authorize @bet
    if @bet.save
      redirect_to game_path(@game)
    else
      redirect_to game_path(@game)
      @error = "T'as déjà parié sur ce match abruti"
    end
  end

  def edit
    @game = @bet.game
  end

  def update
    @game = @bet.game
    if @bet.update(bet_params)
      redirect_to user_path(@bet.user)
    else
     render :edit
    end
  end

  def destroy
    @bet.destroy
    redirect_to user_path(current_user)
  end

  private

  def bet_params
    params.require(:bet).permit(:score1bet, :score2bet)
  end

  def set_bet
    @bet = Bet.find(params[:id])
    authorize @bet
  end
end

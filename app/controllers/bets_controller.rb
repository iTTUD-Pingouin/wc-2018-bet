class BetsController < ApplicationController

  def new
    @game = Game.find(params[:game_id])
    @bet = Bet.new
  end

  def create
    @game = Game.find(params[:game_id])
    @bet = Bet.new(bet_params)
    @bet.game = @game
    @bet.user = current_user
    if @bet.save
      redirect_to game_path(@game)
    else
      @error = "T'as déjà parié ahuri"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def bet_params
    params.require(:bet).permit(:score1bet, :score2bet)
  end
end

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
    @bet = Bet.find(params[:id])
    @game = @bet.game
  end

  def update
    @bet = Bet.find(params[:id])
    @game = @bet.game
    if @bet.update(bet_params)
      redirect_to user_path(@bet.user)
    else
     render :edit
    end
  end

  def destroy
    @bet = Bet.find(params[:id])
    @bet.destroy
    redirect_to user_path(current_user)
  end

  private

  def bet_params
    params.require(:bet).permit(:score1bet, :score2bet)
  end
end

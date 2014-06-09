class BetController < ApplicationController
  def new
  	@bet = Bet.new
  	@bet.games.build Game.groups_stage
  end

  def create
	  @bet = Bet.new	 
	  @bet.save
	  redirect_to(@bet)
	end
	
	private
  def bet_params
    params.require(:bet).permit(games_attributes: [:id, :score_team1, :score_team2, :team1, :team2])
  end

end

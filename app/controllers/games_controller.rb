class GamesController < ApplicationController
	def index
		@games = Game.all
	end
	
	def edit
		@game = Game.find(params[:id])
	end
	
	def update
		@game = Game.find(params[:game][:id])		
		@game.update(user_params)
	  redirect_to @games
	end

	private
  def game_params  	
    params.require(:game).permit(:id, :actual_score_team1, :actual_score_team2)    
  end
end

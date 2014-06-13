class GamesController < ApplicationController
	def index
		@games = Game.all
	end

	def list
		@games = Game.all
	end

	def show
		@users = User.all
		@game = Game.find(params[:id])
	end

	def edit
		@game = Game.find(params[:id])
	end
	
	def update
		@game = Game.find(params[:game][:id])		
		@game.update(game_params)
	  redirect_to games_path
	end

	private
  def game_params  	
    params.require(:game).permit(:id, :actual_score_team1, :actual_score_team2)    
  end
end

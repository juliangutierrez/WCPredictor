class UsersController < ApplicationController

	def index
		@users = User.sorted
		@games = Game.order :number
		@chart = User.build_chart
	end

  def new
  	@user = User.new
  end

  def create
	  @user = User.new(user_params)
	  @user.bets = Bet.initialize_bets(1)
	  @user.save
	  redirect_to edit_user_path(@user)
	end

	def edit
		@user = User.find(params[:id])  	
	end

	def update
		@user = User.find(params[:user][:id])		
		@user.update(user_params)
	  redirect_to users_path
	end

	def show
		@user = User.find(params[:id])
	end

	private
  def user_params  	
    params.require(:user).permit(:id, :name, :champion_id, :striker, bets_attributes: [:id, :score_team1, :score_team2, :game_id])    
  end
end

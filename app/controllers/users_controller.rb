class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
	  @user = User.new(user_params)	
	  @user.save
	  redirect_to edit_user_path(@user)
	end

	def edit
		@user = User.find(params[:id])
  	@user.bets = Bet.initialize_bets(1)
	end

	def update
		@user = User.find(params[:user][:id])		
		@user.update(user_params)
	  redirect_to @user
	end

	def show
		@user = User.find(params[:id])
	end

	private
  def user_params  	
    params.require(:user).permit(:id, :name, bets_attributes: [:score_team1, :score_team2, :game_id])    
  end
end

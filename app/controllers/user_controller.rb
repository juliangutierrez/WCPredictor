class UserController < ApplicationController
  def new
  	@user = User.new
  end

  def create
	  @user = User.new(article_params)
	 
	  @user.save
	  redirect_to bet_new_path
	end

	private
  def article_params
    params.require(:user).permit(:name)
  end
end

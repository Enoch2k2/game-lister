class UserGamesController < ApplicationController
  def add_game
    user_game = UserGame.new(user_game_params)

    if user_game.save
      flash[:notice] = "#{user_game.game.name} has been added."
    else
      flash[:notice] = "Something went wrong."
    end  
    redirect_to games_path
  end

  private
    def user_game_params
      params.require(:user_game).permit(:game_id, :user_id)
    end
end

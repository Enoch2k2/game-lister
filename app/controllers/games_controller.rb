class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_if_not_admin, except: [:index]

  def index
    @games = Game.alphabetized
  end

  def my_games
    @games = current_user.games
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      flash[:notice] = "Game created"
      redirect_to games_path
    else
      flash.now[:notice] = @game.errors.full_messages.to_sentence
      render :new
    end
  end

  private

    def game_params
      params.require(:game).permit(:name, :image_url)
    end
end

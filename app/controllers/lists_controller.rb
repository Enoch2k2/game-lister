class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game
  before_action :set_user_game, only: [:index, :new, :create]
  before_action :set_list, only: [:show, :destroy]

  def index
    @lists = @user_game.lists
  end

  def new
    @list = @user_game.lists.build
  end

  def create
    @list = @user_game.lists.build(list_params)
    if @list.save
      flash[:notice] = "List has been created."
      redirect_to game_lists_path(@game)
    else
      flash.now[:notice] = @list.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
  end

  def destroy
    if @list
      @list.destroy
      flash[:notice] = "#{@list.name} has been deleted."
    else
      flash[:notice] = "List doesn't exist"
    end

    redirect_to game_lists_path(@game)
  end

  private
    def set_list
      @list = List.find_by_id(params[:id])
    end

    def set_game
      @game = Game.find_by_id(params[:game_id])
    end

    def set_user_game
      @user_game = UserGame.find_by(user_id: current_user.id, game_id: params[:game_id])
    end

    def list_params
      params.require(:list).permit(:name)
    end
end

class ListItemsController < ApplicationController
  before_action :set_game
  before_action :set_list
  before_action :set_list_item, only: [:complete_list_item]

  def new
    @list_item = @list.list_items.build
  end

  def create
    @list_item = @list.list_items.build(list_item_params)

    if @list_item.save
      flash[:notice] = "Created List Item"
      redirect_to game_list_path(@game, @list)
    else
      flash.now[:notice] = @list_item.errors.full_messages.to_sentence
      render :new
    end
  end

  def complete_list_item
    @list_item.update(complete: true)
    flash[:notice] = "#{@list_item.item.name} has been collected."
    redirect_to game_list_path(@game, @list)
  end

  private
    def list_item_params
      params.require(:list_item).permit(
        :quantity,
        :complete,
        :item_id,
        :list_id,
        item_attributes: [:name, :game_id]
      )
    end

    def set_game
      @game = Game.find_by_id(params[:game_id])
    end

    def set_list
      @list = List.find_by_id(params[:list_id])
    end

    def set_list_item
      @list_item = ListItem.find_by_id(params[:id])
    end
end

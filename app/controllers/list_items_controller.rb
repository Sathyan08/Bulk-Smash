class ListItemsController < ApplicationController
  before_action :authenticate_user!

  def new
    @list_item = ListItem.new
  end

  def create
    @list_item = ListItem.new(list_item_params)
    list = List.find(params[:list_id])
    @list_item.list = list

    if @list_item.save
      redirect_to list_path(list), notice: "Successfully Created!"
    else
      redirect_to list_path(list), notice: "Could Not Save"
    end
  end

  private

  def list_item_params
    params.require(:list_item).permit(:list_id, :food_id, :amount)
  end
end

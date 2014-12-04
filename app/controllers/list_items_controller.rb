class ListsItemsController < ApplicationController

  def new
    @list_item = ListItem.new
  end

  def create
    binding.pry
  end

end

class ListsController < ApplicationController

  def new
    @list = List.new
  end

end

class BulksController < ApplicationController
  before_action :authenticate_user!

  def index
    @bulks = Bulk.all
  end

  def show
    @bulk = Bulk.find(params[:id])
  end

  def new
    @bulk = Bulk.new
  end

  def create
    @bulk = Bulk.new(bulk_params)

    if @bulk.save
      redirect_to @bulk, notice: 'Successfully Created!'
    else
      flash[:notice] = "Could Not Save"
      render :new
    end
  end

  private

  def bulk_params
    params.require(:bulk).permit(:food_id, :amount, :price)
  end

end

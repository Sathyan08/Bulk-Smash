class UnitsController < ApplicationController

  def index
    @units = Unit.all
  end

  # def show
  #   @manufacturer = Manufacturer.find(params[:id])
  #   @cars = @manufacturer.cars
  # end

  def new
    @unit = Unit.new
  end

  # def create
  #   @manufacturer = Manufacturer.new(manufacturer_params)

  #   if @manufacturer.save
  #     redirect_to({ action: "index" }, notice: 'Successfully Created!')
  #   else
  #     flash[:notice] = "Could Not Save"
  #     render :new
  #   end
  # end

  private

  def unit_params
    params.require(:unit).permit(:name)
  end
end
